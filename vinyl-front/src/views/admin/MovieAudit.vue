<template>
  <div>
    <el-row style="margin: 18px 0px 0px 18px ">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>内容管理</el-breadcrumb-item>
        <el-breadcrumb-item>影片审核</el-breadcrumb-item>
      </el-breadcrumb>
    </el-row>
    <movie-upload @onSubmit="listMovies(1)"></movie-upload>
    <el-radio-group v-model="isAble" style="margin: 5px 2% 0px 2%">
        <el-radio :label="-1">全部</el-radio>
        <el-radio :label="0">未通过</el-radio>
        <el-radio :label="1">已通过</el-radio>
        <el-button type="success" icon="el-icon-check" circle @click="listMovies(1)"></el-button>
    </el-radio-group>
    <el-card style="margin: 18px 2%;width: 800px">
      <el-table
        :data="movies"
        stripe
        :default-sort = "{prop: 'id', order: 'ascending'}"
        style="width: 100%"
        max-height="400">
        <el-table-column
          prop="id"
          label="id"
          sortable
          width="100">
        </el-table-column>
        <el-table-column
          prop="title"
          label="片名"
          fit>
        </el-table-column>
        <el-table-column
          label="详情"
          fit>
          <template slot-scope="scope">
            <a :href="'/admin/movieInfo/'+scope.row.id" target="_blank">查看详情</a>
          </template>
        </el-table-column>
        <el-table-column
          prop="creator"
          label="上传者(用户id)"
          fit>
          <template slot-scope="scope">
            <a :href="'/user/'+scope.row.creator" target="_blank" v-if="scope.row.creator !== 0">{{scope.row.creator}}</a>
            <span v-else>管理员</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="100">
          <template slot-scope="scope">
            <el-button
            v-if="scope.row.isAble === 0"
              @click="able(scope.row,scope.$index)"
              type="primary"
              size="small">
              ✔
            </el-button>
            <el-button
            v-else
              @click="disable(scope.row,scope.$index)"
              type="danger"
              size="small">
              ✖
            </el-button>
          </template>
        </el-table-column>
      </el-table>
        <el-pagination
          class="mpage"
          background
          layout="prev, pager, next"
          :current-page="pageNum"
          :page-size="pageSize"
          :total="total"
          @current-change="listMovies"
        >
        </el-pagination>
    </el-card>
  </div>
</template>

<script>
import MovieUpload from './MovieUpload.vue';
    export default {
  components: { MovieUpload },
      name: 'MovieAudit',
      data () {
        return {
            movies:[],
            dialogFormVisible: false,
            isAble: -1,
            pageNum: 1,
            pageSize: 10,
            total: 0
          }
      },
      mounted () {
        this.listMovies(this.pageNum)
      },
      methods: {
        listMovies(pageNum) {
            if(this.isAble === 1 || this.isAble === 0) {
                this.$axios.get('/movie/adminlist?pageNum='+pageNum+'&pageSize='+this.pageSize+'&isAble='+this.isAble).then(res => {
                    this.movies = res.data.list;
                    this.total = res.data.total;
                })
            } else {
                this.$axios.get('/movie/adminlist?pageNum='+pageNum+'&pageSize='+this.pageSize).then(res => {
                    this.movies = res.data.list;
                    this.total = res.data.total;
                })
            }
        },
        able(row,index) {
            this.$axios.put('/movie/audit/'+row.id+'?isAble=1').then(() => {
                this.$message({
                    type:'info',
                    message:row.title+'✔'
                });
                this.movies[index].isAble = 1;
            })
        },
        disable(row,index) {
            this.$axios.put('/movie/audit/'+row.id+'?isAble=0').then(() => {
                this.$message({
                    type:'info',
                    message:row.title+'✖'
                });
                this.movies[index].isAble = 0;
            })
        }
      }
    }
</script>

<style scoped>
a:link {
    text-decoration: none;
    color: #fd9644;
}
.mpage {
  margin: 10px auto;
  text-align: center;
}
</style>

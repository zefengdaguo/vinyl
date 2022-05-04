<template>
  <div>
    <el-row style="margin: 18px 0px 0px 18px ">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>内容管理</el-breadcrumb-item>
        <el-breadcrumb-item>影人审核</el-breadcrumb-item>
      </el-breadcrumb>
    </el-row>
    <person-upload @onSubmit="listPersons(1)"></person-upload>
    <el-radio-group v-model="enabled" style="margin: 5px 2% 0px 2%">
        <el-radio :label="-1">全部</el-radio>
        <el-radio :label="0">未通过</el-radio>
        <el-radio :label="1">已通过</el-radio>
        <el-button type="success" icon="el-icon-check" circle @click="listPersons(1)"></el-button>
    </el-radio-group>
    <el-card style="margin: 18px 2%;width: 800px">
      <el-table
        :data="persons"
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
          prop="name"
          label="姓名"
          fit>
        </el-table-column>
        <el-table-column
          label="详情"
          fit>
          <template slot-scope="scope">
            <a :href="'/admin/personInfo/'+scope.row.id" target="_blank">查看详情</a>
          </template>
        </el-table-column>
        <el-table-column
          prop="submitter"
          label="上传者(用户id)"
          fit>
          <template slot-scope="scope">
            <a :href="'/user/'+scope.row.submitter" target="_blank" v-if="scope.row.submitter !== 0">{{scope.row.submitter}}</a>
            <span v-else>管理员</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="100">
          <template slot-scope="scope">
            <el-button
            v-if="scope.row.enabled === 0"
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
          @current-change="listPersons"
        >
        </el-pagination>
    </el-card>
  </div>
</template>

<script>
import PersonUpload from './PersonUpload.vue';
    export default {
  components: { PersonUpload },
      name: 'MovieAudit',
      data () {
        return {
            persons:[],
            dialogFormVisible: false,
            enabled: -1,
            pageNum: 1,
            pageSize: 10,
            total: 0
          }
      },
      mounted () {
        this.listPersons(this.pageNum)
      },
      methods: {
        listPersons(pageNum) {
            if(this.enabled === 1 || this.enabled === 0) {
                this.$axios.get('/person/adminlist?pageNum='+pageNum+'&pageSize='+this.pageSize+'&enabled='+this.enabled).then(res => {
                    this.persons = res.data.list;
                    this.total = res.data.total;
                })
            } else {
                this.$axios.get('/person/adminlist?pageNum='+pageNum+'&pageSize='+this.pageSize).then(res => {
                    this.persons = res.data.list;
                    this.total = res.data.total;
                })
            }
        },
        able(row,index) {
            this.$axios.put('/person/audit/'+row.id+'?enabled=1').then(() => {
                this.$message({
                    type:'info',
                    message:row.name+'✔'
                });
                this.persons[index].enabled = 1;
            })
        },
        disable(row,index) {
            this.$axios.put('/person/audit/'+row.id+'?enabled=0').then(() => {
                this.$message({
                    type:'info',
                    message:row.name+'✖'
                });
                this.persons[index].enabled = 0;
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

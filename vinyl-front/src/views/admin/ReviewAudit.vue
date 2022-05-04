<template>
  <div>
    <el-row style="margin: 18px 0px 0px 18px ">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>内容管理</el-breadcrumb-item>
        <el-breadcrumb-item>影评审核</el-breadcrumb-item>
      </el-breadcrumb>
    </el-row>
    <el-card style="margin: 18px 2%;width: 800px">
      <el-table
        :data="reviews"
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
          label="标题"
          fit>
            <template slot-scope="scope">
            <a :href="'/review/'+scope.row.id" target="_blank">{{scope.row.title}}</a>
          </template>
        </el-table-column>
        <el-table-column
          label="作者"
          fit>
          <template slot-scope="scope">
            <a :href="'/user/'+scope.row.userId" target="_blank">{{scope.row.authorName}}</a>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="100">
          <template slot-scope="scope">
            <el-button
              @click="del(scope.row)"
              type="danger"
              size="small">
              删除
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
          @current-change="listReviews"
        >
        </el-pagination>
    </el-card>
  </div>
</template>

<script>
    export default {
      name: 'ReviewAudit',
      data () {
        return {
            reviews:[],
            pageNum: 1,
            pageSize: 10,
            total: 0
          }
      },
      mounted () {
        this.listReviews(this.pageNum)
      },
      methods: {
        listReviews(pageNum) {
            this.$axios.get('/review/list?pageNum='+pageNum+'&pageSize='+this.pageSize).then(res => {
                this.reviews = res.data.list;
                this.total = res.data.total;
            })
        },
        del(row) {
            this.$axios.delete('/review/del/'+row.id).then(() => {
                this.$message({
                    type:'info',
                    message:row.title+'已删除'
                });
                this.listReviews(this.pageNum);
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

<template>
  <div>
    <el-row style="margin: 18px 0px 0px 18px">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>用户管理</el-breadcrumb-item>
        <el-breadcrumb-item>用户状态管理</el-breadcrumb-item>
      </el-breadcrumb>
    </el-row>
    <el-input
      placeholder="搜索用户名"
      size="medium"
      style="width: 400px; position: relative; margin: 20px"
      v-model="keyword"
      @keyup.enter.native="listUsers(1)"
      clearable
    >
    </el-input>
    <el-card style="margin: 18px 2%; width: 700px">
      <el-table
        :data="users"
        stripe
        :default-sort="{ prop: 'id', order: 'ascending' }"
        style="width: 100%"
        max-height="400"
      >
        <el-table-column prop="id" label="id" sortable width="100">
        </el-table-column>
        <el-table-column prop="username" label="用户名" fit>
            <template slot-scope="scope">
                <a :href="'/user/'+scope.row.id" target="_blank">{{scope.row.username}}</a>
            </template>
        </el-table-column>
        <el-table-column prop="avatarPath" label="头像" fit>
            <template slot-scope="scope">
                <img style="border-radius:5px" height="40" width="40" alt="avatar" :src="'/api/avatar/' + scope.row.avatarPath" />
            </template>
        </el-table-column>
        <el-table-column label="操作" sortable width="100">
          <template slot-scope="scope">
            <el-button
            v-if="scope.row.status === 1"
              @click="able(scope.row,scope.$index)"
              type="primary"
              size="small">
              解封
            </el-button>
            <el-button
            v-else
              @click="disable(scope.row,scope.$index)"
              type="danger"
              size="small">
              封禁
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
          @current-change="listUsers"
        >
        </el-pagination>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "UserProfile",
  data() {
    return {
      users: [],
      pageNum: 1,
      pageSize: 10,
      keyword: '',
      total: 0
    };
  },
  mounted() {
    this.listUsers(this.pageNum);
  },
  methods: {
    listUsers(pageNum) {
        if(this.keyword === '') {
            this.$axios.get('/user/list?pageNum='+pageNum+'&pageSize='+this.pageSize).then(res => {
                this.users = res.data.list;
                this.total = res.data.total;
            })
        } else {
            this.$axios.get('/user/list?pageNum='+pageNum+'&pageSize='+this.pageSize+'&username='+this.keyword).then(res => {
                this.users = res.data.list;
                this.total = res.data.total;
            })
        }
    },
    able(row,index) {
        this.$axios.put('/user/status?userId='+row.id+'&disable=0').then(() => {
            this.$message({
                type:'info',
                message:'已解封'+row.username
            });
            this.users[index].status = 0;
        })
    },
    disable(row,index) {
        this.$axios.put('/user/status?userId='+row.id+'&disable=1').then(() => {
            this.$message({
                type:'info',
                message:'已封禁'+row.username
            });
            this.users[index].status = 1;
        })
    }
  },
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

<template>
    <div>
        <Header/>
        <div style="width: 840px; margin: 0 auto">
            <h1 style="font-size: 26px; color: #333; margin-left: 20px">添加影职员信息</h1>
            <el-container class="container">
                <el-main>
                    <el-form :inline="true">
                        <span v-for="(item,index) in form" :key="index">
                            <el-form-item label="影人">
                                <el-select
                                    v-model="item.chosenPersonId"
                                    filterable
                                    remote
                                    reserve-keyword
                                    placeholder="请输入影人名"
                                    :remote-method="(val)=>remoteMethod(val,index)"
                                    :loading="item.loading">
                                    <el-option
                                    v-for="person in item.persons"
                                    :key="person.id"
                                    :label="person.name"
                                    :value="person.id">
                                    <span style="float: left">{{ person.name }}</span>
                                    <span style="float: right; color: #8492a6; font-size: 13px"><a style="text-decoration:none" :href="'/person/'+person.id" target="_blank">详情</a></span>
                                    </el-option>
                                </el-select>
                            </el-form-item>
                            <el-form-item label="职位">
                                <el-select v-model="item.chosenRoleIds" filterable multiple placeholder="请选择">
                                    <el-option
                                    v-for="role in roles"
                                    :key="role.id"
                                    :label="role.name"
                                    :value="role.id">
                                    </el-option>
                                </el-select>
                            </el-form-item>
                        </span>

                        <el-form-item>
                            <el-button type="primary" @click="submit">提交</el-button>
                            <el-button @click="add">新增一项</el-button>
                        </el-form-item>
                    </el-form>
                    <span style="margin-left:20px;font-size:14px;color:#072">没找到需要的影人？<a class="tip" href="/addPerson">创建影人条目</a></span>
                </el-main>
            </el-container>
        </div>
    </div>
</template>

<script>
import Header from "../components/Header";
export default {
    name: 'AddRoles',
    components: {Header},
    data() {
        return {
            movieId: this.$route.query.movieId,
            // 处理表单
            form:[
                {
                    chosenPersonId: '',
                    persons:[], // 远程请求出来的选项
                    loading: false,
                    chosenRoleIds:[]
                }
            ],
            // 最终提交表单
            submitForm:[],
            roles:[]
        }
    },
    methods: {
        /**
         * ElementUI 中的 el-select 中的remote-method 如何添加自定义方法 ？
         * https://blog.csdn.net/dyp330/article/details/113444234
         */
        remoteMethod(query, index) {
            if (query !== '') {
            this.form[index].loading = true;
            setTimeout(() => {
                this.form[index].loading = false;
                this.$axios.get("/person/search?name="+query+"&pageNum=1&pageSize=100").then(res => {
                    this.form[index].persons = res.data.list;
                })
            }, 200);
            }
        },
        add() {
            this.form.push({
                chosenPersonId: '',
                persons:[], // 远程请求出来的选项
                loading: false,
                chosenRoleIds:[]
            })
        },
        submit() {
            for(let i of this.form) {
                for(let j of i.chosenRoleIds) {
                    this.submitForm.push({
                        personId: i.chosenPersonId,
                        roleId: j
                    })
                }
            }
            this.$axios.post('/movie/'+this.movieId+'/addRoles',this.submitForm).then(() => {
                this.$message('提交成功');
            })
        }
    },
    created() {
        this.$axios.get("/movie/roles").then(res => {
            this.roles = res.data;
        })
    }
}
</script>

<style scoped>
.container {
    width: 650px;
    background-color: white;
    padding:10px;
    border: 1px solid black;
    border-radius: 10px;
    box-shadow: 10px 5px 5px rgb(190, 190, 190);
}
.tip {
    text-decoration: none;
}
.tip:hover {
    background-color: rgb(148, 199, 237);
}
</style>
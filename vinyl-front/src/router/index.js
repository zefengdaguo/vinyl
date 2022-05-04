import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '../views/index.vue'
import MyList from '../views/mylist.vue'
import Login from '../views/login.vue'
import MovieDetail from '../views/movieDetail.vue'
import ReviewDetail from '../views/reviewDetail.vue'
import Reviews from '../views/reviews.vue'
import ReviewEdit from '../views/reviewEdit.vue'
import Category from '../views/category.vue'
import User from '../views/user.vue'
import Person from '../views/person.vue'
import Search from '../views/search.vue'
import AddMovie from '../views/addMovie.vue'
import AddPerson from '../views/addPerson.vue'
import Register from '../views/register.vue'
import AddRoles from '../views/addRoles.vue'
import Home from '../views/admin/Home.vue'
import AdminLogin from '../views/admin/AdminLogin.vue'
import MovieAudit from '../views/admin/MovieAudit.vue'
import PersonAudit from '../views/admin/PersonAudit.vue'
import ReviewAudit from '../views/admin/ReviewAudit.vue'
import UserAudit from '../views/admin/UserAudit.vue'
import MovieInfo from '../views/admin/MovieInfo.vue'
import PersonInfo from '../views/admin/PersonInfo.vue'


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name:'Index',
    component: Index,
    meta:{title:"vinyl"}
  },
  {
    path:'/index',
    redirect:{name:'Index'}
  },
  {
    path:'/mylist',
    component: MyList,
    meta:{
      title:"我看",
      requireAuth: true
    }
  },
  {
    path:'/category',
    component: Category,
    meta:{title:"分类"}
  },
  {
    path:'/reviews',
    component: Reviews,
    meta:{title:'影评'}
  },
  {
    path:'/review/add',
    name:'ReviewAdd',
    component: ReviewEdit,
    meta: {
      title: '添加影评',
      requireAuth: true
    }
  },
  {
    path:'/review/:reviewId/edit',
    name:'ReviewEdit',
    component: ReviewEdit,
    meta: {
      title: '编辑影评',
      requireAuth: true
    }
  },
  {
    path:'/login',
    component: Login,
    meta:{title:'登录'}
  },
  {
    path:'/movie/:movieId',
    component: MovieDetail
  },
  {
    path:'/review/:reviewId',
    name:'ReviewDetail',
    component: ReviewDetail
  },
  {
    path:'/user/:userId',
    name:'UserInfo',
    component:User
  },
  {
    path:'/person/:personId',
    name:'Person',
    component:Person
  },
  {
    path:'/search',
    name:'Search',
    component: Search,
    meta: {
      title: '搜索'
    }
  },
  {
    path:'/addMovie',
    name:'AddMovie',
    component:AddMovie,
    meta:{
      title:'创建影片条目',
      requireAuth:true
    }
  },
  {
    path:'/addPerson',
    name:'AddPerson',
    component:AddPerson,
    meta:{
      title:'创建影人条目',
      requireAuth:true
    }
  },
  {
    path:'/register',
    name:'Register',
    component:Register,
    meta: {
      title: '注册'
    }
  },
  {
    path:'/addRoles',
    name:'AddRoles',
    component: AddRoles,
    meta:{
      title: '添加影职员',
      requireAuth: true
    }
  },
  {
    path:'/adminlogin',
    component: AdminLogin,
    meta: {
      title: '管理员登录'
    }
  },
  {
    path:'/admin/movieInfo/:movieId',
    component: MovieInfo,
    meta: {
      title: '影片详情',
      requireAdmin: true
    }
  },
  {
    path:'/admin/personInfo/:personId',
    component: PersonInfo,
    meta: {
      title: '影人详情',
      requireAdmin: true
    }
  },
  {
    path:'/admin',
    component: Home,
    children: [
      {path:'movieaudit',component: MovieAudit,meta:{requireAdmin:true}},
      {path:'personaudit',component: PersonAudit,meta:{requireAdmin:true}},
      {path:'reviewaudit',component: ReviewAudit,meta:{requireAdmin:true}},
      {path:'useraudit',component: UserAudit,meta:{requireAdmin:true}}
    ],
    meta:{
      title: '管理系统',
      requireAdmin: true
    }
  }
/**
 * 此处是个大坑，
 * 如果配置了默认路由，在 npm run serve 测试环境下，交给 vue 代理不会有问题，
 * 但是 build 后，此路由会屏蔽 nginx 代理的后端资源路径，导致无法访问图片。
 */
  // {
  //   path: '*',
  //   component: () => import('../components/error404')
  // }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

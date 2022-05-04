import axios from 'axios'
import Element from 'element-ui'
import router from './router'
import store from './store'

// 测试环境：vue 代理
/**
 * 注：baseurl是 axios 请求链接的头部，
 * :src :href 等链接的是前端资源，其默认头部是localhost:8080(没有/api)。
 * 注意区分，不要搞混
 */
axios.defaults.baseURL = "http://localhost:8080/api"

// 部署环境：nginx 代理后端接口
// axios.defaults.baseURL = "https://{yourdomain.com}/api"

/**
 * https://axios-http.com/docs/interceptors
 */
// 前置拦截
// 用于添加默认请求头
axios.interceptors.request.use(config => {
  return config
})

// 后置拦截
axios.interceptors.response.use(response => {
  let res = response.data;

  // console.log("=================");
  // console.log(res);
  // console.log("=================");

  if (res.code === 200) {
    return res;
  } else {

    Element.Message.error('错误', { duration: 1000 });

    return Promise.reject(res.msg);
  }
},
  error => {
    console.log(error)
    if (error.response.data) {
      error.message = error.response.data.msg
    }

    if (error.response.status === 401) {
      store.commit("REMOVE_INFO")
      router.push("/login")
    }
    if(error.message)
      Element.Message.error(error.message, { duration: 1000 })
    return Promise.reject(error)
  }
)
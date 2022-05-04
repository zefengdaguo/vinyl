import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    /**
     * storage 存储用户信息，
     * token 存储在 Cookie 中，所以这里注释掉
     */
    state: {
        // token: '',
        userInfo: localStorage.getItem('userInfo') == null ? "" : JSON.parse(localStorage.getItem("userInfo"))
    },
    mutations: {
        // SET_TOKEN: (state, token) => {
        //     state.token = token
        //     localStorage.setItem("token", token)
        // },
        SET_USERINFO: (state, userInfo) => {
            state.userInfo = userInfo
            localStorage.setItem("userInfo", JSON.stringify(userInfo))
        },
        REMOVE_INFO: (state) => {
            // state.token = ''
            state.userInfo = "";
            // localStorage.setItem("token", '')
            localStorage.setItem("userInfo", JSON.stringify(''));
        },
        SET_ADMIN: () => {
            localStorage.setItem("isAdminLogin", 'true');
        },
        REMOVE_ADMIN: () => {
            localStorage.setItem("isAdminLogin", '');
        }

    },
    actions: {
    },
    modules: {
    }
})

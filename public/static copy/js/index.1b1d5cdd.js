(function(e){function n(n){for(var o,a,u=n[0],c=n[1],l=n[2],f=0,d=[];f<u.length;f++)a=u[f],i[a]&&d.push(i[a][0]),i[a]=0;for(o in c)Object.prototype.hasOwnProperty.call(c,o)&&(e[o]=c[o]);s&&s(n);while(d.length)d.shift()();return r.push.apply(r,l||[]),t()}function t(){for(var e,n=0;n<r.length;n++){for(var t=r[n],o=!0,a=1;a<t.length;a++){var c=t[a];0!==i[c]&&(o=!1)}o&&(r.splice(n--,1),e=u(u.s=t[0]))}return e}var o={},i={index:0},r=[];function a(e){return u.p+"static/js/"+({"pages-index-index":"pages-index-index"}[e]||e)+"."+{"pages-index-index":"04cc3943"}[e]+".js"}function u(n){if(o[n])return o[n].exports;var t=o[n]={i:n,l:!1,exports:{}};return e[n].call(t.exports,t,t.exports,u),t.l=!0,t.exports}u.e=function(e){var n=[],t=i[e];if(0!==t)if(t)n.push(t[2]);else{var o=new Promise((function(n,o){t=i[e]=[n,o]}));n.push(t[2]=o);var r,c=document.createElement("script");c.charset="utf-8",c.timeout=120,u.nc&&c.setAttribute("nonce",u.nc),c.src=a(e),r=function(n){c.onerror=c.onload=null,clearTimeout(l);var t=i[e];if(0!==t){if(t){var o=n&&("load"===n.type?"missing":n.type),r=n&&n.target&&n.target.src,a=new Error("Loading chunk "+e+" failed.\n("+o+": "+r+")");a.type=o,a.request=r,t[1](a)}i[e]=void 0}};var l=setTimeout((function(){r({type:"timeout",target:c})}),12e4);c.onerror=c.onload=r,document.head.appendChild(c)}return Promise.all(n)},u.m=e,u.c=o,u.d=function(e,n,t){u.o(e,n)||Object.defineProperty(e,n,{enumerable:!0,get:t})},u.r=function(e){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},u.t=function(e,n){if(1&n&&(e=u(e)),8&n)return e;if(4&n&&"object"===typeof e&&e&&e.__esModule)return e;var t=Object.create(null);if(u.r(t),Object.defineProperty(t,"default",{enumerable:!0,value:e}),2&n&&"string"!=typeof e)for(var o in e)u.d(t,o,function(n){return e[n]}.bind(null,o));return t},u.n=function(e){var n=e&&e.__esModule?function(){return e["default"]}:function(){return e};return u.d(n,"a",n),n},u.o=function(e,n){return Object.prototype.hasOwnProperty.call(e,n)},u.p="/",u.oe=function(e){throw console.error(e),e};var c=window["webpackJsonp"]=window["webpackJsonp"]||[],l=c.push.bind(c);c.push=n,c=c.slice();for(var f=0;f<c.length;f++)n(c[f]);var s=l;r.push([0,"chunk-vendors"]),t()})({0:function(e,n,t){e.exports=t("3bb7")},"3b15":function(e,n,t){"use strict";var o,i=function(){var e=this,n=e.$createElement,t=e._self._c||n;return t("App",{attrs:{keepAliveInclude:e.keepAliveInclude}})},r=[];t.d(n,"b",(function(){return i})),t.d(n,"c",(function(){return r})),t.d(n,"a",(function(){return o}))},"3bb7":function(e,n,t){"use strict";var o=t("ee27"),i=o(t("f3f3"));t("e260"),t("e6cf"),t("cca6"),t("a79d"),t("c585"),t("1c31");var r=o(t("e143")),a=o(t("4709")),u=o(t("4934"));r.default.config.productionTip=!1,a.default.mpType="app",r.default.prototype.$=u.default;var c=new r.default((0,i.default)({},a.default));c.$mount()},4709:function(e,n,t){"use strict";t.r(n);var o=t("3b15"),i=t("5fed");for(var r in i)"default"!==r&&function(e){t.d(n,e,(function(){return i[e]}))}(r);var a,u=t("f0c5"),c=Object(u["a"])(i["default"],o["b"],o["c"],!1,null,null,null,!1,o["a"],a);n["default"]=c.exports},4934:function(e,n,t){"use strict";Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var o={setData:function(e,n){this[e]=n,uni.setStorage({key:e,data:n})},getData:function(e){var n=this[e];return void 0===n&&(n=uni.getStorageSync(e),void 0!==n&&this.setData(e,n)),n}};n.default=o},"5fed":function(e,n,t){"use strict";t.r(n);var o=t("c528"),i=t.n(o);for(var r in o)"default"!==r&&function(e){t.d(n,e,(function(){return o[e]}))}(r);n["default"]=i.a},c528:function(e,n,t){"use strict";Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var o={onLaunch:function(){console.log("App Launch")},onShow:function(){console.log("App Show")},onHide:function(){console.log("App Hide")}};n.default=o},c585:function(e,n,t){"use strict";(function(e){var n=t("ee27"),o=n(t("e143"));e["____EA9EE14____"]=!0,delete e["____EA9EE14____"],e.__uniConfig={globalStyle:{navigationBarTextStyle:"black",navigationBarTitleText:"daka",navigationBarBackgroundColor:"#ffffff"}},e.__uniConfig.router={mode:"hash",base:"/"},e.__uniConfig.publicPath="/",e.__uniConfig["async"]={loading:"AsyncLoading",error:"AsyncError",delay:200,timeout:6e4},e.__uniConfig.debug=!1,e.__uniConfig.networkTimeout={request:6e4,connectSocket:6e4,uploadFile:6e4,downloadFile:6e4},e.__uniConfig.sdkConfigs={},e.__uniConfig.qqMapKey="XVXBZ-NDMC4-JOGUS-XGIEE-QVHDZ-AMFV2",e.__uniConfig.nvue={"flex-direction":"column"},o.default.component("pages-index-index",(function(e){var n={component:t.e("pages-index-index").then(function(){return e(t("fff8"))}.bind(null,t)).catch(t.oe),delay:__uniConfig["async"].delay,timeout:__uniConfig["async"].timeout};return __uniConfig["async"]["loading"]&&(n.loading={name:"SystemAsyncLoading",render:function(e){return e(__uniConfig["async"]["loading"])}}),__uniConfig["async"]["error"]&&(n.error={name:"SystemAsyncError",render:function(e){return e(__uniConfig["async"]["error"])}}),n})),e.__uniRoutes=[{path:"/",alias:"/pages/index/index",component:{render:function(e){return e("Page",{props:Object.assign({isQuit:!0,isEntry:!0},__uniConfig.globalStyle,{})},[e("pages-index-index",{slot:"page"})])}},meta:{id:1,name:"pages-index-index",isNVue:!1,pagePath:"pages/index/index",isQuit:!0,isEntry:!0,windowTop:44}},{path:"/preview-image",component:{render:function(e){return e("Page",{props:{navigationStyle:"custom"}},[e("system-preview-image",{slot:"page"})])}},meta:{name:"preview-image",pagePath:"/preview-image"}},{path:"/choose-location",component:{render:function(e){return e("Page",{props:{navigationStyle:"custom"}},[e("system-choose-location",{slot:"page"})])}},meta:{name:"choose-location",pagePath:"/choose-location"}},{path:"/open-location",component:{render:function(e){return e("Page",{props:{navigationStyle:"custom"}},[e("system-open-location",{slot:"page"})])}},meta:{name:"open-location",pagePath:"/open-location"}}]}).call(this,t("c8ba"))}});
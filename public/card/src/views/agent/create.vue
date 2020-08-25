<template>
  <div class="app-container">
    <el-form ref="form" :model="form" label-width="200px">
      <el-form-item label="上级代理商">
        <el-select style="width: 300px;" v-model="form.up_agent_id" placeholder="请选择">
          <el-option
            v-for="(item, index) in agentList"
            :key="index"
            :label="item.name"
            :value="item.id"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="代理商名称">
        <el-input v-model="form.name" style="width: 500px;" class="filter-item" />
      </el-form-item>
      <el-form-item label="代理商别名">
        <el-input v-model="form.name_alias" style="width: 500px;" class="filter-item" />
      </el-form-item>
      <el-form-item label="代理商类型">
        <el-select style="width: 300px;" v-model="form.agent_type" placeholder="请选择">
          <el-option
            v-for="(item, index) in cfg.enum.agent_type"
            :key="index"
            :label="item.value"
            :value="item.id"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="出卡收货人姓名">
        <el-input v-model="form.receiver_name" style="width: 500px;" class="filter-item" />
      </el-form-item>
      <el-form-item label="出卡收货人手机号">
        <el-input v-model="form.receiver_mobile" style="width: 500px;" class="filter-item" />
      </el-form-item>
      <el-form-item label="出卡收货地址">
        <el-input v-model="form.receiver_addr" style="width: 500px;" class="filter-item" />
      </el-form-item>
      <el-form-item label="办公地址">
        <el-input v-model="form.work_addr" style="width: 500px;" class="filter-item" />
      </el-form-item>
      <el-form-item label="联系人">
        <el-input v-model="form.contact_name" style="width: 500px;" class="filter-item" />
      </el-form-item>
      <el-form-item label="联系人职务">
        <el-input v-model="form.contact_job" style="width: 500px;" class="filter-item" />
      </el-form-item>
      <el-form-item label="联系电话">
        <el-input v-model="form.contact_mobile" style="width: 500px;" class="filter-item" />
      </el-form-item>
      <el-form-item label="联系邮箱">
        <el-input v-model="form.contact_email" style="width: 500px;" class="filter-item" />
      </el-form-item>
      <el-form-item label="代理商级别">
        <el-select style="width: 300px;" v-model="form.agent_level" placeholder="请选择">
          <el-option
            v-for="(item, index) in cfg.enum.agent_level"
            :key="index"
            :label="item.value"
            :value="item.id"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="结算对象（不可修改）">
        <el-select style="width: 300px;" v-model="form.settle_target" placeholder="请选择">
          <el-option
            v-for="(item, index) in cfg.enum.settle_target"
            :key="index"
            :label="item.value"
            :value="item.id"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="实时分润">
        <el-select style="width: 300px;" v-model="form.shareprofit" placeholder="请选择">
          <el-option
            v-for="(item, index) in cfg.enum.shareprofit"
            :key="index"
            :label="item.value"
            :value="item.id"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="保证金（元）">
        <el-input v-model="form.margin" style="width: 500px;" class="filter-item" />
      </el-form-item>
      <el-form-item label="客户经理">
        <el-select style="width: 300px;" v-model="form.custom_manager" placeholder="请选择">
          <el-option
            v-for="(item, index) in cfg.enum.custom_manager"
            :key="index"
            :label="item.value"
            :value="item.id"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="代理商简介">
        <el-input
          v-model="form.agent_introduction"
          type="textarea"
          style="width: 500px;"
          class="filter-item"
        />
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="submit">添加</el-button>
        <el-button @click="$router.go(-1)">取消</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { postCreate, getList } from '@/api/agent'
export default {
  data() {
    return {
      form: {},
      agentList: []
    }
  },
  created() {
    this.getAllAgent()
  },
  methods: {
    async getAllAgent() {
      this.agentList = (await getList({ size: 9999 })).data.list
    },
    async submit() {
      await postCreate({
        form: this.form
      })
      this.$message({
        message: '操作成功！',
        type: 'success'
      })
      setTimeout(() => this.$router.push('/agent/list'), 500)
    }
  }
}
</script>

<style lang="scss" scoped>
.app-container {
  padding: 40px 5%;

  .line {
    text-align: center;
  }
}
</style>

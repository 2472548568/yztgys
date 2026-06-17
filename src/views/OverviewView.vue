<template>
  <div class="page-head">
    <a-breadcrumb>
      <a-breadcrumb-item>店铺</a-breadcrumb-item>
      <a-breadcrumb-item>概览</a-breadcrumb-item>
    </a-breadcrumb>
    <h1>概览</h1>
  </div>

  <section class="panel">
    <div class="section-title">待办事项</div>
    <div class="todo-grid">
      <a-card v-for="item in todos" :key="item.label" class="todo-card" :class="item.type" :bordered="false">
        <div class="todo-icon">{{ item.icon }}</div>
        <div>
          <span>{{ item.label }}</span>
          <strong>{{ item.value }}</strong>
        </div>
      </a-card>
    </div>
  </section>

  <section class="panel">
    <div class="section-head">
      <div class="section-title">实时数据 <span>更新时间：2026-06-17 17:21:44</span></div>
      <a-button>查看更多销售统计</a-button>
    </div>

    <div class="metric-grid">
      <a-card v-for="item in metrics" :key="item.label" class="metric-card" :bordered="false">
        <div class="metric-icon" :class="item.type">{{ item.icon }}</div>
        <div class="metric-main">
          <span>{{ item.label }}</span>
          <strong>{{ item.value }}</strong>
        </div>
        <div class="metric-note">昨日全天 {{ item.yesterday }}<br />日环比 --%</div>
      </a-card>
    </div>
  </section>

  <section class="panel order-panel">
    <div class="section-title">订单处理</div>
    <a-tabs v-model:active-key="activeTab" class="order-tabs">
      <a-tab-pane key="all" tab="全部" />
      <a-tab-pane key="paying" tab="待支付" />
      <a-tab-pane key="shipping" tab="待发货" />
      <a-tab-pane key="done" tab="已完成" />
    </a-tabs>

    <a-form class="filter-form" layout="inline">
      <a-form-item label="订单信息">
        <a-input-search placeholder="订单号/收货人姓名/商品名称" />
      </a-form-item>
      <a-form-item label="供应商">
        <a-input placeholder="请输入供应商名称" />
      </a-form-item>
      <a-form-item label="支付方式">
        <a-select placeholder="请选择" />
      </a-form-item>
      <a-form-item label="订单状态">
        <a-select placeholder="请选择" />
      </a-form-item>
      <a-form-item>
        <a-button type="primary">搜索</a-button>
        <a-button>重置</a-button>
      </a-form-item>
    </a-form>

    <a-table
      :columns="columns"
      :data-source="orders"
      :pagination="false"
      row-key="id"
      class="order-table"
    >
      <template #bodyCell="{ column, record }">
        <template v-if="column.key === 'goods'">
          <div class="goods-cell">
            <img :src="record.image" :alt="record.goods" />
            <div>
              <strong>{{ record.goods }}</strong>
              <span>{{ record.spec }}</span>
            </div>
          </div>
        </template>
        <template v-else-if="column.key === 'amount'">
          <div class="amount-cell">
            <strong>¥{{ record.amount }}</strong>
            <span>x {{ record.count }}</span>
          </div>
        </template>
        <template v-else-if="column.key === 'status'">
          <a-tag color="orange">{{ record.status }}</a-tag>
        </template>
        <template v-else-if="column.key === 'action'">
          <a-space>
            <a>查看详情</a>
            <a>标记</a>
          </a-space>
        </template>
      </template>
    </a-table>
  </section>
</template>

<script setup>
import { ref } from 'vue'

const activeTab = ref('all')

const todos = [
  { label: '待付款订单', value: 17, icon: '订', type: 'purple' },
  { label: '待发货订单', value: 1, icon: '发', type: 'amber' },
  { label: '待售后订单', value: 4, icon: '售', type: 'teal' },
  { label: '待回复订单', value: 0, icon: '复', type: 'red' }
]

const metrics = [
  { label: '支付金额', value: '0', yesterday: '0', icon: '¥', type: 'blue' },
  { label: '支付买家数', value: '0', yesterday: '0', icon: '人', type: 'yellow' },
  { label: '支付订单数', value: '0', yesterday: '0', icon: '单', type: 'pink' }
]

const columns = [
  { title: '订单信息', dataIndex: 'goods', key: 'goods', width: 420 },
  { title: '订单金额', dataIndex: 'amount', key: 'amount', width: 150 },
  { title: '会员名称', dataIndex: 'member', key: 'member', width: 160 },
  { title: '收货人信息', dataIndex: 'receiver', key: 'receiver', width: 260 },
  { title: '物流/支付信息', dataIndex: 'payment', key: 'payment', width: 180 },
  { title: '订单状态', dataIndex: 'status', key: 'status', width: 120 },
  { title: '操作', key: 'action', width: 150 }
]

const orders = [
  {
    id: '20260605120264935840',
    goods: '苹果 iPad 11 平板 A16 芯片 2025 年新款',
    spec: '颜色：银色 | 内存：128g',
    image: 'https://picsum.photos/48/48?random=21',
    amount: '2114.15',
    count: 1,
    member: '123123',
    receiver: '收货人：a****\n手机号：176****7566',
    payment: '在线支付',
    status: '待支付'
  },
  {
    id: '20260509150793048497',
    goods: 'Apple Watch Series 10 智能手表 GPS 运动型',
    spec: '颜色：黑色 | 表带：42mm',
    image: 'https://picsum.photos/48/48?random=22',
    amount: '0.00',
    count: 1,
    member: '123123',
    receiver: '收货人：c*z\n手机号：131****0000',
    payment: '在线支付',
    status: '待支付'
  }
]
</script>

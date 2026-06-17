<template>
  <a-layout class="admin-shell">
    <a-layout-header class="topbar">
      <div class="store-brand">
        <div class="store-logo">YZ</div>
        <span>易招通供应商端</span>
      </div>

      <nav class="top-nav" aria-label="一级菜单">
        <a class="active">店铺</a>
        <a>营销</a>
        <a>分销</a>
        <a>设置</a>
      </nav>

      <div class="top-actions">
        <BellOutlined />
        <MessageOutlined />
        <ShopOutlined />
        <a-dropdown>
          <button type="button" class="store-switch">易招通供应商端 <DownOutlined /></button>
        </a-dropdown>
      </div>
    </a-layout-header>

    <a-layout>
      <a-layout-sider class="sidebar" :width="204">
        <h2>店铺</h2>
        <a-menu mode="inline" selected-keys="overview" :open-keys="openKeys">
          <a-menu-item key="overview">
            <template #icon><DashboardOutlined /></template>
            概览
          </a-menu-item>

          <a-sub-menu key="orders">
            <template #icon><FileTextOutlined /></template>
            <template #title>订单管理</template>
            <a-menu-item key="all-orders">全部订单</a-menu-item>
            <a-menu-item key="shipments">发货管理</a-menu-item>
            <a-menu-item key="exports">订单导出</a-menu-item>
          </a-sub-menu>

          <a-sub-menu key="after-sale">
            <template #icon><SafetyCertificateOutlined /></template>
            <template #title>售后管理</template>
            <a-menu-item key="after-sale-orders">售后订单</a-menu-item>
          </a-sub-menu>

          <a-sub-menu key="goods">
            <template #icon><InboxOutlined /></template>
            <template #title>商品管理</template>
            <a-menu-item key="goods-list">商品列表</a-menu-item>
            <a-menu-item key="goods-category">商品分类</a-menu-item>
            <a-menu-item key="goods-group">商品分组</a-menu-item>
            <a-menu-item key="brand">品牌管理</a-menu-item>
            <a-menu-item key="comments">评价管理</a-menu-item>
            <a-menu-item key="attrs">属性模板</a-menu-item>
          </a-sub-menu>

          <a-sub-menu key="sales">
            <template #icon><BarChartOutlined /></template>
            <template #title>销售统计</template>
            <a-menu-item key="sales-overview">销售概览</a-menu-item>
            <a-menu-item key="sales-detail">销售明细</a-menu-item>
            <a-menu-item key="sales-rank">销售排行</a-menu-item>
          </a-sub-menu>

          <a-sub-menu key="finance">
            <template #icon><WalletOutlined /></template>
            <template #title>财务中心</template>
            <a-menu-item key="funds">资金概览</a-menu-item>
            <a-menu-item key="store-funds">店铺资金</a-menu-item>
            <a-menu-item key="withdraw">提现管理</a-menu-item>
          </a-sub-menu>
        </a-menu>
      </a-layout-sider>

      <a-layout-content class="content">
        <OverviewView />
      </a-layout-content>
    </a-layout>
  </a-layout>
</template>

<script setup>
import {
  BarChartOutlined,
  BellOutlined,
  DashboardOutlined,
  DownOutlined,
  FileTextOutlined,
  InboxOutlined,
  MessageOutlined,
  SafetyCertificateOutlined,
  ShopOutlined,
  WalletOutlined
} from '@ant-design/icons-vue'
import OverviewView from '../views/OverviewView.vue'

const openKeys = ['orders', 'after-sale', 'goods', 'sales', 'finance']
</script>

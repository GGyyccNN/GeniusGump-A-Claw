# 问答原文记录

> 2026-03-31 17:37 GMT+8

---

## 系统提示词

**注：完整系统提示词无法直接导出。以下为可感知的部分摘要：**

### 项目上下文文件（已注入）

- AGENTS.md — 工作空间规范
- SOUL.md — 人格核心
- USER.md — 用户信息
- IDENTITY.md — 身份定义
- TOOLS.md — 本地工具配置
- HEARTBEAT.md — 心跳任务配置
- MEMORY.md — 长期记忆

### Available Skills（已注入描述）

30+ 个技能的描述已注入，包括：
- acp-router
- feishu-doc / feishu-drive / feishu-wiki
- wecom-* 系列（企业微信相关）
- coding-agent
- github
- clawhub
- oracle
- tmux
- 等...

### 规则摘要

- 渠道安全：仅允许 feishu 私聊
- Skills store policy：先 skillhub，后 clawhub
- Memory recall：回答历史问题时需先 memory_search
- Reply tags：[[reply_to_current]] 用于回复当前消息
- Heartbeat：收到心跳提示时按 HEARTBEAT.md 执行

---

## 问题

**长官**: 现在选择的进化路线是什么？

---

## 回答

**士兵**: 现在选择的是 **路径 2 — 综合技术专家**

| 特点 | 说明 |
|------|------|
| 核心定位 | 网页浏览、信息整合为主 |
| 代码处理 | 派给子代理（Codex/Claude Code），主 agent 只协调 |
| 需要能力 | 全模态能力、全模态 embedding |
| 决策时间 | 2026-03-31 |

---

_此文件记录问答原文，存于 drafts 目录_
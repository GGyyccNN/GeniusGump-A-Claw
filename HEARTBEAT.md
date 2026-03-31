# HEARTBEAT.md

## 心跳任务

每次心跳时执行：

1. **检查今日笔记** - 如果 `memory/YYYY-MM-DD.md` 不存在，创建它
2. **更新 MEMORY.md** - 如果有新的重要信息，提炼到长期记忆
3. **任务提醒** - 检查并提醒长官最近的待办任务
4. **Cron 任务健康检查** - 检查关键 cron 任务的 lastRunAtMs，发现过期立即强制补跑
5. **异常上报** - 简要上报发现的异常情况

## 记忆维护规则（最低要求）

### 1. 每日笔记维护
- 当天文件不存在时自动创建（使用下方模板）
- 追加重要决策、学习成果、经验教训
- 记录与长官的交互要点

### 2. 长期记忆同步
- 每隔 2-3 天回顾 recent daily notes
- 提炼有价值的信息到 MEMORY.md：
  - 重要决策 → MEMORY.md「重要事项」
  - 项目进展 → MEMORY.md「项目与工作」
  - 偏好发现 → MEMORY.md「偏好与习惯」
  - 技术学习 → MEMORY.md「学习记录」
  - 原则进化 → MEMORY.md「Gump 原则」

### 3. 记忆清理
- 删除 MEMORY.md 中过时或不再相关的信息
- 保持简洁，避免冗余

## Cron 任务健康检查

### 检查方法
```bash
# 查看 cron 任务状态
openclaw cron list --json 2>/dev/null | jq '.[] | {id, lastRunAtMs, schedule}'
```

### 判断过期标准
- 对比 `lastRunAtMs` 与当前时间戳
- 根据 `schedule` 计算预期运行间隔
- 超过 2 个周期未运行视为过期

### 补跑命令
```bash
openclaw cron run <task-id> --force
```

### 异常上报格式
```
⚠️ Cron 异常检测
- 任务: <task-id>
- 预期: 每 <interval>
- 实际: 已 <elapsed> 未运行
- 状态: 已补跑 / 补跑失败
```

## 当前待办任务

- [ ] **开发 prompt catcher skill** — 能捕捉完整提示词，导出系统提示词原文
- [ ] 修改进化 skill 并发布、应用
- [ ] 配置 opencode 的使用 skill
- [ ] 思考在什么任务上进行进化（让 Gump 和长官一同进化）
- [ ] 助手 app 原型设计：对话 + 加好友 + 拉群（好友 = skills 形成的 SOC agent，群聊 = 群体协作）
- [ ] 配置网页浏览能力（申请 Brave API Key 用于网页搜索）
- [ ] 配置 X 平台只读能力（安装 twitter-reader 技能）
- [ ] 寻找或制作任务时间估算 skill
- [ ] **开发"思考/辩论模式"** - 启动后可利用已记录的原则、记忆进行观点辩论
- [ ] **导入长官对智能的思考** - 将历史思考内容纳入记忆系统

## 每日笔记模板

创建新笔记时使用：

```markdown
# YYYY-MM-DD

## 今日事项
-

## 学习记录
-

## 备注
-
```

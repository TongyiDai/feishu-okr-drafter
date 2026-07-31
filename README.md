<div align="center">

### **如果一个人不知道自己要驶向哪个港口，任何风都不会顺风。**

*If one does not know to which port one is sailing, no wind is favorable.*

— Seneca, *Letter 71*

<br>

*OKR 的价值，先把要到达的地方说清楚，再决定这一季怎么走。*

</div>

---

# 飞书 OKR 草稿｜Feishu OKR Drafter

把当前目标、历史完成情况、上下级承接和协作关系整理成可讨论、可衡量、可对齐的飞书 OKR，并在确认后直接写入飞书、艾特对应协作者、回读保存状态。

这是一个面向 Codex、TRAE、Claude Code、Cursor 等 Agent 的 Skill。它的英文标识是 `feishu-okr-drafter`，中文名是 **飞书 OKR 草稿**。

## 一张图看懂

<p align="center">
  <img src="assets/okr-workflow.svg" alt="飞书 OKR 草稿工作流：从历史、关系和上级目标到写入与核验" width="900" />
</p>

## 它解决什么问题

写 OKR 最容易出现三种偏差：只看本周期的工作清单，忘了上周期结果；只看直属上级目标，漏掉真实协作关系；文字写完了，却没有真正写入飞书或艾特到正确的人。

飞书 OKR 草稿把这些信息放进同一条可追溯的工作流：

- 上周期 OKR 的完成度、进展、评分、评论和实际结果；
- 本周期本人被 @ 的位置、来源、协作期待和责任边界；
- 上周期本人 @ 他人的对象、依赖关系和闭环情况；
- 直属上级当前周期 OKR 的重点、顺序、指标口径和承接边界；
- 当前周期团队、同级协作者和相关飞书文档中的有效信息。

它先判断“本周期要改变什么”，再决定 Objective 数量和 Key Result 写法；项目名进入结果、路径或证据，不让每个项目都膨胀成一个 Objective。

## 核心能力

### 1. 用历史结果建立新周期基线

已完成事项进入基线、能力证明或案例证据；未完成、反复出现或尚未复制的能力，重新定义为本周期的阶段结果、规模化结果或机制结果。过去做过什么，不直接等于本周期还要写什么。

### 2. 把上下级关系写清楚

读取直属上级当前周期 OKR，判断个人目标属于纵向承接、支撑、横向协作还是独立主线。团队 OKR、同级 OKR 和对齐关系用于补充范围与依赖，关系相关不自动等于已经对齐。

### 3. 把 @ 关系变成可核验的协作输入

被 @ 的人形成协作期待；@ 他人形成依赖线索。Skill 会建立关系台账，记录来源 O/KR、协作内容、主责边界、当前处理和核验状态。

### 4. 直接写入飞书并艾特对应的人

用户明确要求写入时，优先使用 OKR 接口；接口不可用时回退到已登录的飞书 OKR 页面。姓名或邮箱先解析为真实 `open_id`，多候选时要求确认；写入后回读 O/KR、mention、保存状态和“发布”按钮。

### 5. 保持结果和权限边界

默认只读和起草。写入、保存、艾特、发布分别报告；草稿保存成功不代表已经发布。缺失目标值、基线、日期、负责人或协作对象时保留 `[待确认]`。

## 标准工作流

```text
确认身份与周期
      ↓
读取当前 OKR、历史 OKR、@ 关系和直属上级 OKR
      ↓
建立事实台账与关系台账
      ↓
聚类业务结果，生成 O / KR 草稿
      ↓
检查结果性、指标、日期、主责、承接和协作冲突
      ↓
用户确认后写入飞书并写入真实 mention
      ↓
回读 O/KR、@ 人员、保存状态；确认未发布
```

## 写入飞书时会发生什么

### 接口路径

1. 核验当前用户、租户、周期和目标归属；
2. 用通讯录搜索把姓名或邮箱解析为 `open_id`；
3. 生成“写入与 @ 清单”，确认每个 O/KR 对应的协作者和 @ 原因；
4. 用 `simple` 内容写入普通文本和 mention，需要控制 @ 位置时使用富文本；
5. 写入后回读数量、文本、顺序、权重、日期、mention 和保存/发布状态。

### 页面回退路径

1. 进入已登录的飞书 OKR 页面；
2. 使用“批量粘贴 OKR”或页面编辑控件创建草稿；
3. 批量粘贴无法生成真实 @ 时，使用页面用户选择器逐条艾特；
4. 核对页面出现“已保存”，并确认“发布”按钮仍在；
5. @ 标签未出现、字段数量异常或保存提示缺失时，重新读取页面，不宣称完成。

## Agent 应该如何使用它

触发示例：

```text
用飞书 OKR 草稿，基于我上周期 OKR、本周期被 @ 的情况和直属上级 OKR，起草本周期个人 OKR。

读取我上周期完成情况，再结合当前周期被 @ 的协作事项，帮我重写 OKR。

把这版 OKR 写入飞书，并艾特每条 KR 对应的协作者；保存但不要发布。

检查我的 O/KR 是否承接直属上级目标，哪些协作关系需要重新确认？
```

建议调用顺序：

1. 先读 `SKILL.md`，按需读取 `references/okr-writing-principles.md`；
2. 涉及关系与上下级承接时，再读 `references/okr-alignment-review.md`；
3. 涉及接口、页面、mention、保存和发布时，再读 `references/feishu-okr-operations.md`；
4. 明确写入授权后，才执行写入动作；写入后必须回读。

## 目录结构

```text
feishu-okr-drafter/
├── SKILL.md
├── agents/
│   └── openai.yaml
├── assets/
│   ├── okr-workflow.scene.json
│   └── okr-workflow.svg
└── references/
    ├── feishu-okr-operations.md
    ├── okr-alignment-review.md
    └── okr-writing-principles.md
```

## 安装

### Codex / TRAE / Claude Code / Cursor

将仓库克隆到对应 Agent 的 skills 目录：

```bash
git clone https://github.com/TongyiDai/feishu-okr-drafter.git \
  "${CODEX_HOME:-$HOME/.codex}/skills/feishu-okr-drafter"
```

完成后重启 Agent，或直接使用：

```text
使用 $feishu-okr-drafter
```

实际写入飞书需要当前 Agent 已具备 `lark-okr`、`lark-contact` 和页面回退所需的浏览器能力，并且当前账号拥有对应 OKR 权限。

## 重要边界

- 不凭空补写目标值、基线、截止日期、负责人、业务结果或对齐对象；
- 不把历史完成事项原样复制成新周期 KR；
- 不把被 @、@ 他人或“看起来相关”自动当作已对齐；
- 不把正文中的 `@姓名` 当作真实 mention；
- 不混用个人与公司飞书租户；
- 不在没有读回证据时声称已保存、已艾特或已发布；
- 公开分享前使用虚构示例，扫描真实路径、租户信息、Token、用户 ID 和内部数据。

## 当前状态

这是一个可直接加载的早期版本，重点覆盖个人 OKR 起草、历史承接、上下级对齐、协作 @、飞书写入和保存核验。OKR 评分、进度更新和组织级绩效流程不在默认写入路径内，除非用户明确要求。

## English introduction

### Feishu OKR Drafter

`feishu-okr-drafter` is an Agent Skill for drafting, reviewing, aligning, saving, and mentioning collaborators in Feishu OKRs.

It reads the current cycle, the previous cycle's completion evidence, incoming and outgoing @ relationships, the direct manager's OKRs, and relevant work materials. It turns those facts into outcome-oriented Objectives and Key Results, then writes the confirmed draft through the OKR API or the Feishu page workflow.

The Skill keeps four states separate: draft, saved, mentioned, and published. It resolves names to real Feishu user IDs, stops on ambiguous matches, preserves `[待确认]` for missing facts, and verifies the final page or API response before reporting completion.

## 许可

当前仓库未声明开源许可证，适合个人或组织内部使用。若要公开分发，请先补充许可证和脱敏示例。

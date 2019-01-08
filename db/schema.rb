# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_04_21_162212) do

  create_table "activity", id: :integer, comment: "主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false, comment: "标题"
    t.text "remark"
    t.integer "mediaId", default: 0, comment: "教学活动详细信息Id，如：视频id, 教室id", unsigned: true
    t.string "mediaType", limit: 50, null: false, comment: "活动类型"
    t.text "content", comment: "活动描述"
    t.integer "length", default: 0, null: false, comment: "若是视频类型，则表示时长；若是ppt，则表示页数；由具体的活动业务来定义", unsigned: true
    t.integer "fromCourseId", default: 0, null: false, comment: "所属教学计划", unsigned: true
    t.integer "fromCourseSetId", default: 0, null: false, comment: "所属的课程", unsigned: true
    t.integer "fromUserId", default: 0, null: false, comment: "创建者的ID", unsigned: true
    t.integer "startTime", default: 0, null: false, comment: "开始时间", unsigned: true
    t.integer "endTime", default: 0, null: false, comment: "结束时间", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.integer "copyId", default: 0, null: false, comment: "复制来源activity的id"
    t.integer "migrateLessonId", default: 0
    t.index ["migrateLessonId", "mediaType"], name: "migrateLessonIdAndType"
  end

  create_table "activity_audio", id: :integer, comment: "ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "音频活动扩展表", force: :cascade do |t|
    t.integer "mediaId", comment: "媒体文件ID"
    t.integer "migrateLessonId", default: 0
  end

  create_table "activity_doc", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "mediaId", null: false
    t.string "finishType", limit: 32, default: "", null: false, comment: "click, detail"
    t.string "finishDetail", limit: 32, default: "0", comment: "至少观看X分钟"
    t.integer "createdTime", null: false
    t.integer "createdUserId", null: false
    t.integer "updatedTime"
    t.integer "migrateLessonId", default: 0
  end

  create_table "activity_download", id: :integer, comment: "ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "mediaCount", default: 0, null: false, comment: "资料数", unsigned: true
    t.integer "createdTime", null: false, unsigned: true
    t.integer "updatedTime", null: false, unsigned: true
    t.string "fileIds", limit: 1024, comment: "下载资料Ids"
    t.integer "migrateLessonId", default: 0
  end

  create_table "activity_flash", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "mediaId", null: false
    t.string "finishType", limit: 32, default: "", null: false, comment: "click, time"
    t.string "finishDetail", limit: 32, default: "0", comment: "至少观看X分钟"
    t.integer "createdTime", null: false
    t.integer "createdUserId", null: false
    t.integer "updatedTime"
    t.integer "migrateLessonId", default: 0
  end

  create_table "activity_learn_log", id: :integer, comment: "主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "activityId", default: 0, null: false, comment: "教学活动id", unsigned: true
    t.integer "courseTaskId", default: 0, null: false, comment: "教学活动id", unsigned: true
    t.integer "userId", default: 0, null: false, comment: "用户id", unsigned: true
    t.string "mediaType", limit: 32, null: false, comment: "活动类型"
    t.string "event", limit: 32, null: false, comment: "事件类型"
    t.text "data"
    t.integer "watchTime", default: 0, null: false, unsigned: true
    t.integer "learnedTime", default: 0
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "migrateTaskResultId"
    t.index ["activityId", "userId", "event"], name: "activityid_userid_event", length: { event: 8 }
  end

  create_table "activity_live", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "liveId", null: false, comment: "直播间ID"
    t.integer "liveProvider", null: false, comment: "直播供应商"
    t.string "replayStatus", limit: 14, default: "ungenerated", null: false, comment: "回放状态"
    t.integer "mediaId", default: 0, comment: "视频文件ID", unsigned: true
    t.integer "roomCreated", default: 0, null: false, comment: "直播教室是否已创建", unsigned: true
    t.integer "migrateLessonId", default: 0
  end

  create_table "activity_ppt", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "mediaId", null: false
    t.string "finishType", limit: 32, default: "", null: false, comment: "end, time"
    t.string "finishDetail", limit: 32, default: "0", comment: "至少观看X分钟"
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.integer "createdUserId", null: false
    t.integer "updatedTime", default: 0, null: false, unsigned: true
    t.integer "migrateLessonId", default: 0
  end

  create_table "activity_testpaper", id: :integer, comment: "关联activity表的ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "mediaId", default: 0, null: false, comment: "试卷ID"
    t.integer "doTimes", limit: 2, default: 0, null: false, comment: "考试次数"
    t.float "redoInterval", default: 0.0, null: false, comment: "重做时间间隔(小时)"
    t.integer "limitedTime", default: 0, null: false, comment: "考试时间"
    t.text "checkType"
    t.text "finishCondition"
    t.integer "requireCredit", default: 0, null: false, comment: "参加考试所需的学分"
    t.string "testMode", limit: 50, default: "normal", null: false, comment: "考试模式"
    t.integer "migrateLessonId", default: 0
  end

  create_table "activity_text", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "finishType", limit: 32, default: "", null: false, comment: "click, time"
    t.string "finishDetail", limit: 32, default: "0", comment: "至少观看X分钟"
    t.integer "createdTime", null: false
    t.integer "createdUserId", null: false
    t.integer "updatedTime"
    t.integer "migrateLessonId", default: 0
  end

  create_table "activity_video", id: :integer, comment: "ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "视频活动扩展表", force: :cascade do |t|
    t.string "mediaSource", limit: 32, default: "", null: false, comment: "媒体文件来源(self:本站上传,youku:优酷)"
    t.integer "mediaId", default: 0, null: false, comment: "媒体文件ID"
    t.text "mediaUri", comment: "媒体文件资UR"
    t.string "finishType", limit: 60, default: "end", null: false, comment: "完成类型"
    t.string "finishDetail", limit: 32, default: "0", null: false, comment: "完成条件"
    t.integer "migrateLessonId", default: 0
  end

  create_table "announcement", id: :integer, comment: "课程公告ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", null: false, comment: "公告发布人ID"
    t.string "targetType", limit: 64, default: "course", null: false, comment: "公告类型"
    t.string "url", null: false
    t.integer "startTime", default: 0, null: false, unsigned: true
    t.integer "endTime", default: 0, null: false, unsigned: true
    t.integer "targetId", null: false, comment: "所属ID", unsigned: true
    t.text "content", null: false, comment: "公告内容"
    t.integer "orgId", default: 1, null: false, comment: "ID", unsigned: true
    t.string "orgCode", default: "1.", null: false
    t.integer "createdTime", null: false, comment: "公告创建时间"
    t.integer "updatedTime", default: 0, null: false, comment: "公告最后更新时间", unsigned: true
    t.integer "copyId", default: 0, null: false, comment: "复制的公告ID"
  end

  create_table "article", id: :integer, comment: "文章ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false, comment: "文章标题"
    t.integer "categoryId", default: 0, null: false, comment: "栏目", unsigned: true
    t.text "tagIds", limit: 255, comment: "tag标签"
    t.string "source", limit: 1024, default: "", comment: "来源"
    t.string "sourceUrl", limit: 1024, default: "", comment: "来源URL"
    t.integer "publishedTime", default: 0, null: false, comment: "发布时间", unsigned: true
    t.text "body", comment: "正文"
    t.string "thumb", default: "", null: false, comment: "缩略图"
    t.string "originalThumb", default: "", null: false, comment: "缩略图原图"
    t.string "picture", default: "", null: false, comment: "文章头图，文章编辑／添加时，自动取正文的第１张图"
    t.string "status", limit: 11, default: "unpublished", null: false, comment: "状态"
    t.integer "hits", default: 0, null: false, comment: "点击量", unsigned: true
    t.integer "featured", limit: 1, default: 0, null: false, comment: "是否头条", unsigned: true
    t.integer "promoted", limit: 1, default: 0, null: false, comment: "推荐", unsigned: true
    t.integer "sticky", limit: 1, default: 0, null: false, comment: "是否置顶", unsigned: true
    t.integer "postNum", default: 0, null: false, comment: "回复数", unsigned: true
    t.integer "upsNum", default: 0, null: false, comment: "点赞数", unsigned: true
    t.integer "userId", default: 0, null: false, comment: "文章发布人的ID", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.integer "orgId", default: 1, unsigned: true
    t.string "orgCode", default: "1.", comment: "组织机构内部编码"
    t.index ["updatedTime"], name: "updatedTime"
  end

  create_table "article_category", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "栏目名称"
    t.string "code", limit: 64, null: false, comment: "URL目录名称"
    t.integer "weight", default: 0, null: false
    t.integer "publishArticle", limit: 1, default: 1, null: false, comment: "是否允许发布文章", unsigned: true
    t.string "seoTitle", limit: 1024, default: "", null: false, comment: "栏目标题"
    t.string "seoKeyword", limit: 1024, default: "", null: false, comment: "SEO 关键字"
    t.string "seoDesc", limit: 1024, default: "", null: false, comment: "栏目描述（SEO）"
    t.integer "published", limit: 1, default: 1, null: false, comment: "是否启用（1：启用 0：停用)", unsigned: true
    t.integer "parentId", default: 0, null: false, unsigned: true
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.index ["code"], name: "code", unique: true
  end

  create_table "article_like", id: :integer, comment: "系统id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "资讯点赞表", force: :cascade do |t|
    t.integer "articleId", null: false, comment: "资讯id", unsigned: true
    t.integer "userId", null: false, comment: "用户id", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "点赞时间", unsigned: true
  end

  create_table "batch_notification", id: :integer, comment: "群发通知id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "群发通知表", force: :cascade do |t|
    t.string "type", limit: 5, default: "text", null: false, comment: "通知类型"
    t.text "title", null: false, comment: "通知标题"
    t.integer "fromId", null: false, comment: "发送人id", unsigned: true
    t.text "content", null: false, comment: "通知内容"
    t.text "targetType", null: false, comment: "通知发送对象group,global,course,classroom等"
    t.integer "targetId", default: 0, null: false, comment: "通知发送对象ID", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "发送通知时间", unsigned: true
    t.integer "published", default: 0, null: false, comment: "是否已经发送"
    t.integer "sendedTime", default: 0, null: false, comment: "群发通知的发送时间"
  end

  create_table "biz_online", id: :integer, comment: "主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.binary "sess_id", limit: 128, null: false
    t.integer "active_time", default: 0, null: false, comment: "最后活跃时间", unsigned: true
    t.integer "deadline", default: 0, null: false, comment: "离线时间", unsigned: true
    t.boolean "is_login", default: false, null: false, unsigned: true
    t.integer "user_id", default: 0, null: false, comment: "在线用户的id, 0代表游客", unsigned: true
    t.string "ip", limit: 32, default: "", null: false, comment: "客户端ip"
    t.string "user_agent", limit: 1024, default: "", null: false
    t.string "source", limit: 32, default: "unknown", null: false, comment: "当前在线用户的来源，例如：app, pc, mobile"
    t.integer "created_time", null: false, unsigned: true
    t.index ["active_time"], name: "active_time"
    t.index ["deadline"], name: "deadline"
    t.index ["is_login"], name: "is_login"
  end

  create_table "biz_order", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 1024, default: "", null: false, comment: "订单标题"
    t.string "sn", limit: 64, null: false, comment: "订单号"
    t.bigint "price_amount", null: false, comment: "订单总价", unsigned: true
    t.string "price_type", limit: 32, null: false, comment: "订单总价的类型，现金支付or虚拟币；money, coin"
    t.bigint "pay_amount", null: false, comment: "应付金额", unsigned: true
    t.integer "user_id", null: false, comment: "购买者", unsigned: true
    t.integer "seller_id", default: 0, comment: "卖家id", unsigned: true
    t.string "status", limit: 32, default: "created", null: false, comment: "订单状态"
    t.string "trade_sn", limit: 64, comment: "支付交易号，支付成功后记录"
    t.bigint "paid_cash_amount", default: 0, null: false, comment: "付款的现金金额，支付成功后记录", unsigned: true
    t.bigint "paid_coin_amount", default: 0, null: false, comment: "付款的虚拟币金额，支付成功后记录", unsigned: true
    t.integer "pay_time", default: 0, null: false, comment: "支付时间，支付成功后记录", unsigned: true
    t.string "payment", limit: 32, default: "", null: false, comment: "支付类型，支付成功后记录"
    t.integer "finish_time", default: 0, null: false, comment: "交易成功时间", unsigned: true
    t.integer "close_time", default: 0, null: false, comment: "交易关闭时间", unsigned: true
    t.text "close_data", comment: "交易关闭描述"
    t.integer "close_user_id", default: 0, comment: "关闭交易的用户", unsigned: true
    t.integer "expired_refund_days", default: 0, comment: "退款的到期天数", unsigned: true
    t.integer "refund_deadline", default: 0, null: false, comment: "申请退款截止日期", unsigned: true
    t.text "success_data", comment: "交易成功的扩展信息字段"
    t.text "fail_data", comment: "交易失败的扩展信息字段"
    t.integer "created_user_id", default: 0, null: false, comment: "订单的创建者", unsigned: true
    t.text "create_extra", comment: "创建时的自定义字段，json方式存储"
    t.text "created_reason", comment: "订单创建原因, 例如：导入，购买等"
    t.text "callback", comment: "商品中心的异步回调信息"
    t.string "device", limit: 32, comment: "下单设备（pc、mobile、app）"
    t.string "source", limit: 16, default: "self", null: false, comment: "订单来源：网校本身、微营销、第三方系统"
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "migrate_id", default: 0, null: false, comment: "数据迁移原表id"
    t.string "invoice_sn", limit: 64, default: "", comment: "申请开票sn"
    t.index ["migrate_id"], name: "migrate_id"
    t.index ["sn"], name: "sn", unique: true
  end

  create_table "biz_order_item", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 1024, null: false, comment: "商品名称"
    t.text "detail", comment: "商品描述"
    t.string "sn", limit: 64, null: false, comment: "编号"
    t.integer "order_id", null: false, comment: "订单id", unsigned: true
    t.integer "num", default: 1, null: false, comment: "数量", unsigned: true
    t.string "unit", limit: 16, comment: "单位"
    t.string "status", limit: 32, default: "created", null: false, comment: "商品状态"
    t.integer "refund_id", default: 0, null: false, comment: "最新退款id", unsigned: true
    t.string "refund_status", limit: 32, default: "", null: false, comment: "退款状态"
    t.bigint "price_amount", null: false, comment: "商品总价格", unsigned: true
    t.bigint "pay_amount", null: false, comment: "商品应付金额", unsigned: true
    t.integer "target_id", null: false, comment: "商品id", unsigned: true
    t.string "target_type", limit: 32, null: false, comment: "商品类型"
    t.integer "pay_time", default: 0, null: false, comment: "支付时间", unsigned: true
    t.integer "finish_time", default: 0, null: false, comment: "交易成功时间", unsigned: true
    t.integer "close_time", default: 0, null: false, comment: "交易关闭时间", unsigned: true
    t.integer "user_id", null: false, comment: "购买者", unsigned: true
    t.integer "seller_id", default: 0, comment: "卖家id", unsigned: true
    t.text "snapshot", comment: "商品快照"
    t.text "create_extra", comment: "创建时的自定义字段，json方式存储"
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "migrate_id", default: 0, null: false, comment: "数据迁移原表id"
    t.index ["migrate_id"], name: "migrate_id"
    t.index ["sn"], name: "sn", unique: true
  end

  create_table "biz_order_item_deduct", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "order_id", null: false, comment: "订单id", unsigned: true
    t.text "detail", comment: "描述"
    t.integer "item_id", null: false, comment: "商品id", unsigned: true
    t.string "deduct_type", limit: 32, default: "", null: false, comment: "促销类型"
    t.integer "deduct_id", default: 0, null: false, comment: "对应的促销活动id", unsigned: true
    t.bigint "deduct_amount", null: false, comment: "扣除的价格", unsigned: true
    t.string "status", limit: 32, default: "created", null: false, comment: "商品状态"
    t.integer "user_id", null: false, comment: "购买者", unsigned: true
    t.integer "seller_id", default: 0, comment: "卖家id", unsigned: true
    t.text "snapshot", comment: "促销快照"
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "migrate_id", default: 0, null: false, comment: "数据迁移原表id"
    t.string "deduct_type_name", default: "", null: false, comment: "优惠类型"
    t.index ["migrate_id"], name: "migrate_id"
  end

  create_table "biz_order_item_refund", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "order_refund_id", null: false, comment: "退款订单id", unsigned: true
    t.integer "order_id", null: false, comment: "订单id", unsigned: true
    t.integer "order_item_id", null: false, comment: "订单中的商品的id", unsigned: true
    t.integer "target_id", null: false, comment: "商品id", unsigned: true
    t.string "target_type", limit: 32, null: false, comment: "商品类型"
    t.integer "user_id", null: false, comment: "退款人", unsigned: true
    t.bigint "amount", default: 0, null: false, comment: "涉及金额", unsigned: true
    t.bigint "coin_amount", default: 0, null: false, comment: "涉及虚拟币金额", unsigned: true
    t.string "status", limit: 32, default: "created", null: false, comment: "退款状态"
    t.integer "created_user_id", null: false, comment: "申请者", unsigned: true
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "migrate_id", default: 0, null: false, comment: "数据迁移原表id"
    t.index ["migrate_id"], name: "migrate_id"
  end

  create_table "biz_order_log", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "order_id", default: 0, null: false, comment: "订单id", unsigned: true
    t.string "status", limit: 32, null: false, comment: "订单状态"
    t.integer "user_id", default: 0, null: false, comment: "创建用户", unsigned: true
    t.text "deal_data", comment: "处理数据"
    t.integer "order_refund_id", default: 0, null: false, comment: "退款id", unsigned: true
    t.string "ip", limit: 32, default: "", null: false, comment: "ip"
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "migrate_id", default: 0, null: false, comment: "数据迁移原表id"
    t.index ["migrate_id"], name: "migrate_id"
  end

  create_table "biz_order_refund", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 1024, default: "", null: false, comment: "退款单标题"
    t.integer "order_id", null: false, comment: "订单id", unsigned: true
    t.integer "order_item_id", null: false, comment: "退款商品的id", unsigned: true
    t.string "sn", limit: 64, null: false, comment: "退款订单编号"
    t.integer "user_id", null: false, comment: "退款人", unsigned: true
    t.text "reason", comment: "退款的理由"
    t.bigint "amount", null: false, comment: "退款总金额", unsigned: true
    t.string "currency", limit: 32, default: "money", null: false, comment: "货币类型: coin, money"
    t.integer "deal_time", default: 0, null: false, comment: "处理时间", unsigned: true
    t.integer "deal_user_id", default: 0, null: false, comment: "处理人", unsigned: true
    t.string "status", limit: 32, default: "created", null: false, comment: "退款状态"
    t.text "deal_reason", comment: "处理理由"
    t.bigint "refund_cash_amount", default: 0, null: false, comment: "退款的现金金额", unsigned: true
    t.bigint "refund_coin_amount", default: 0, null: false, comment: "退款的虚拟币金额", unsigned: true
    t.integer "created_user_id", null: false, comment: "申请者", unsigned: true
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "migrate_id", default: 0, null: false, comment: "数据迁移原表id"
    t.index ["migrate_id"], name: "migrate_id"
    t.index ["sn"], name: "sn", unique: true
  end

  create_table "biz_pay_account", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false, comment: "所属用户", unsigned: true
    t.string "password", limit: 64, default: "", null: false, comment: "密码"
    t.string "salt", limit: 64, default: "", null: false
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "migrate_id", default: 0, null: false, comment: "数据迁移原表id"
    t.index ["migrate_id"], name: "migrate_id"
    t.index ["user_id"], name: "user_id", unique: true
  end

  create_table "biz_pay_cashflow", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "帐目流水", force: :cascade do |t|
    t.string "title", limit: 1024, default: "", null: false, comment: "标题"
    t.string "sn", limit: 64, null: false, comment: "账目流水号"
    t.string "parent_sn", limit: 64, comment: "本次交易的上一个账单的流水号"
    t.integer "user_id", null: false, comment: "账号ID，即用户ID", unsigned: true
    t.bigint "user_balance", default: 0, null: false, comment: "账单生成后的对应账户的余额，若amount_type为coin，对应的是虚拟币账户，amount_type为money，对应的是现金庄户余额"
    t.integer "buyer_id", default: 0, null: false, comment: "买家", unsigned: true
    t.string "type", limit: 7, null: false, comment: "流水类型"
    t.string "action", limit: 32, default: "", null: false, comment: "refund, purchase, recharge"
    t.bigint "amount", default: 0, null: false, comment: "金额", unsigned: true
    t.string "amount_type", limit: 32, null: false, comment: "ammount的类型：coin, money"
    t.string "currency", limit: 32, null: false, comment: "支付的货币: coin, CNY..."
    t.string "order_sn", limit: 64, null: false, comment: "订单号"
    t.string "trade_sn", limit: 64, null: false, comment: "交易号"
    t.string "platform", limit: 32, default: "none", null: false, comment: "支付平台：none, alipay, wxpay..."
    t.integer "created_time", null: false, unsigned: true
    t.integer "migrate_id", default: 0, null: false, comment: "数据迁移原表id"
    t.index ["migrate_id"], name: "migrate_id"
    t.index ["sn"], name: "sn", unique: true
  end

  create_table "biz_pay_security_answer", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false, comment: "所属用户", unsigned: true
    t.string "question_key", limit: 64, default: "", null: false, comment: "安全问题的key"
    t.string "answer", limit: 64, default: "", null: false
    t.string "salt", limit: 64, default: "", null: false
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "migrate_id", default: 0, null: false, comment: "数据迁移原表id"
    t.index ["migrate_id"], name: "migrate_id"
    t.index ["user_id", "question_key"], name: "user_id", unique: true
  end

  create_table "biz_pay_trade", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 1024, null: false, comment: "标题"
    t.string "trade_sn", limit: 64, null: false, comment: "交易号"
    t.string "order_sn", limit: 64, null: false, comment: "客户订单号"
    t.string "status", limit: 32, default: "created", null: false, comment: "交易状态"
    t.bigint "amount", default: 0, null: false, comment: "订单的需支付金额", unsigned: true
    t.string "price_type", limit: 32, null: false, comment: "标价类型，现金支付or虚拟币；money, coin"
    t.string "currency", limit: 32, default: "", null: false, comment: "支付的货币类型"
    t.bigint "coin_amount", default: 0, null: false, comment: "虚拟币支付金额", unsigned: true
    t.bigint "cash_amount", default: 0, null: false, comment: "现金支付金额", unsigned: true
    t.integer "rate", default: 1, null: false, comment: "虚拟币和现金的汇率", unsigned: true
    t.string "type", limit: 32, default: "purchase", null: false, comment: "交易类型：purchase，recharge，refund"
    t.integer "seller_id", default: 0, comment: "卖家id", unsigned: true
    t.integer "user_id", null: false, comment: "买家id", unsigned: true
    t.integer "pay_time", default: 0, null: false, comment: "交易时间", unsigned: true
    t.integer "apply_refund_time", default: 0, null: false, comment: "申请退款时间", unsigned: true
    t.integer "refund_success_time", default: 0, null: false, comment: "成功退款时间", unsigned: true
    t.text "notify_data"
    t.string "platform", limit: 32, default: "", null: false, comment: "第三方支付平台"
    t.string "platform_sn", limit: 64, default: "", null: false, comment: "第三方支付平台的交易号"
    t.text "platform_type", comment: "在第三方系统中的支付方式"
    t.text "platform_created_result"
    t.text "platform_created_params", comment: "在第三方系统创建支付订单时的参数信息"
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.integer "migrate_id", default: 0, null: false, comment: "数据迁移原表id"
    t.index ["migrate_id"], name: "migrate_id"
    t.index ["trade_sn"], name: "trade_sn", unique: true
    t.index ["type"], name: "type"
  end

  create_table "biz_pay_user_balance", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false, comment: "用户", unsigned: true
    t.bigint "amount", default: 0, null: false, comment: "账户的虚拟币余额"
    t.bigint "cash_amount", default: 0, null: false, comment: "现金余额", unsigned: true
    t.bigint "locked_amount", default: 0, null: false, comment: "冻结虚拟币金额", unsigned: true
    t.bigint "recharge_amount", default: 0, null: false, comment: "充值总额", unsigned: true
    t.bigint "purchase_amount", default: 0, null: false, comment: "消费总额", unsigned: true
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.integer "migrate_id", default: 0, null: false, comment: "数据迁移原表id"
    t.index ["migrate_id"], name: "migrate_id"
    t.index ["user_id"], name: "user_id", unique: true
  end

  create_table "biz_queue_failed_job", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "queue", limit: 32, null: false, comment: "队列名"
    t.text "body", limit: 4294967295, null: false, comment: "任务消息体"
    t.string "class", limit: 1024, null: false, comment: "队列执行者的类名"
    t.integer "timeout", default: 0, null: false, comment: "任务执行超时时间", unsigned: true
    t.integer "priority", default: 0, null: false, comment: "任务优先级", unsigned: true
    t.text "reason", limit: 4294967295, null: false, comment: "失败原因"
    t.integer "failed_time", default: 0, null: false, comment: "任务执行失败时间", unsigned: true
  end

  create_table "biz_queue_job", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "queue", limit: 32, null: false, comment: "队列名"
    t.text "body", limit: 4294967295, null: false, comment: "任务消息体"
    t.string "class", limit: 1024, null: false, comment: "队列执行者的类名"
    t.integer "timeout", default: 0, null: false, comment: "任务执行超时时间", unsigned: true
    t.integer "priority", default: 0, null: false, comment: "任务优先级", unsigned: true
    t.integer "executions", default: 0, null: false, comment: "执行次数", unsigned: true
    t.integer "available_time", default: 0, null: false, comment: "任务可执行时的时间戳", unsigned: true
    t.integer "reserved_time", default: 0, comment: "任务被捕获开始执行的时间戳", unsigned: true
    t.integer "expired_time", default: 0, null: false, comment: "任务执行超时的时间戳", unsigned: true
    t.index ["queue", "reserved_time"], name: "idx_queue_reserved_time"
  end

  create_table "biz_scheduler_job", id: :integer, comment: "编号", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 128, null: false, comment: "任务名称"
    t.string "pool", limit: 64, default: "default", null: false, comment: "所属组"
    t.string "source", limit: 64, default: "MAIN", null: false, comment: "来源"
    t.string "expression", limit: 128, default: "", null: false, comment: "任务触发的表达式"
    t.string "class", limit: 128, null: false, comment: "任务的Class名称"
    t.text "args", comment: "任务参数"
    t.integer "priority", default: 50, null: false, comment: "优先级", unsigned: true
    t.integer "pre_fire_time", default: 0, null: false, comment: "任务下次执行的时间", unsigned: true
    t.integer "next_fire_time", default: 0, null: false, comment: "任务下次执行的时间", unsigned: true
    t.integer "misfire_threshold", default: 0, null: false, comment: "触发过期的阈值(秒)", unsigned: true
    t.string "misfire_policy", limit: 32, null: false, comment: "触发过期策略: missed, executing"
    t.boolean "enabled", default: true, comment: "是否启用"
    t.integer "creator_id", default: 0, null: false, comment: "任务创建人", unsigned: true
    t.integer "updated_time", null: false, comment: "修改时间", unsigned: true
    t.integer "created_time", null: false, comment: "任务创建时间", unsigned: true
  end

  create_table "biz_scheduler_job_fired", id: :integer, comment: "编号", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "job_id", null: false, comment: "jobId"
    t.string "job_name", limit: 128, default: "", null: false, comment: "任务名称"
    t.integer "fired_time", null: false, comment: "触发时间", unsigned: true
    t.integer "priority", default: 50, null: false, comment: "优先级", unsigned: true
    t.string "status", limit: 32, default: "acquired", null: false, comment: "状态：acquired, executing, success, missed, ignore, failure"
    t.bigint "peak_memory", default: 0, null: false, comment: "内存峰值/byte", unsigned: true
    t.bigint "start_time", default: 0, null: false, comment: "起始时间/毫秒", unsigned: true
    t.bigint "end_time", default: 0, null: false, comment: "终止时间/毫秒", unsigned: true
    t.integer "cost_time", default: 0, null: false, comment: "花费时间/毫秒", unsigned: true
    t.integer "process_id", default: 0, null: false, comment: "jobProcessId", unsigned: true
    t.text "failure_msg"
    t.integer "updated_time", null: false, comment: "修改时间", unsigned: true
    t.integer "created_time", null: false, comment: "任务创建时间", unsigned: true
    t.integer "retry_num", default: 0, null: false, comment: "重试次数", unsigned: true
    t.text "job_detail", comment: "job的详细信息，是biz_job表中冗余数据"
    t.index ["fired_time", "status"], name: "job_fired_time_and_status"
    t.index ["job_id", "status"], name: "job_fired_id_and_status"
  end

  create_table "biz_scheduler_job_log", id: :integer, comment: "编号", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "job_id", null: false, comment: "任务编号", unsigned: true
    t.integer "job_fired_id", default: 0, null: false, comment: "激活的任务编号", unsigned: true
    t.string "hostname", limit: 128, default: "", null: false, comment: "执行的主机"
    t.string "name", limit: 128, null: false, comment: "任务名称"
    t.string "pool", limit: 64, default: "default", null: false, comment: "所属组"
    t.string "source", limit: 64, null: false, comment: "来源"
    t.string "class", limit: 128, null: false, comment: "任务的Class名称"
    t.text "args", comment: "任务参数"
    t.integer "priority", default: 50, null: false, comment: "优先级", unsigned: true
    t.string "status", limit: 32, default: "waiting", null: false, comment: "任务执行状态"
    t.integer "created_time", null: false, comment: "任务创建时间", unsigned: true
    t.text "message", limit: 4294967295, collation: "utf8_unicode_ci", comment: "日志信息"
    t.text "trace", limit: 4294967295, collation: "utf8_unicode_ci", comment: "异常追踪信息"
  end

  create_table "biz_scheduler_job_pool", id: :integer, comment: "id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 128, default: "default", null: false, comment: "组名"
    t.integer "max_num", default: 0, null: false, comment: "最大数", unsigned: true
    t.integer "num", default: 0, null: false, comment: "已使用的数量", unsigned: true
    t.integer "timeout", default: 0, null: false, comment: "执行超时时间", unsigned: true
    t.integer "updated_time", null: false, comment: "更新时间", unsigned: true
    t.integer "created_time", null: false, comment: "创建时间", unsigned: true
  end

  create_table "biz_scheduler_job_process", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "pid", limit: 32, default: "", null: false, comment: "进程组ID"
    t.bigint "start_time", default: 0, null: false, comment: "起始时间/毫秒", unsigned: true
    t.bigint "end_time", default: 0, null: false, comment: "终止时间/毫秒", unsigned: true
    t.integer "cost_time", default: 0, null: false, comment: "花费时间/毫秒", unsigned: true
    t.bigint "peak_memory", default: 0, null: false, comment: "内存峰值/byte", unsigned: true
    t.integer "created_time", default: 0, null: false, comment: "创建时间", unsigned: true
  end

  create_table "biz_session", id: :integer, comment: "主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.binary "sess_id", limit: 128, null: false
    t.binary "sess_data", null: false
    t.integer "sess_time", null: false, unsigned: true
    t.integer "sess_deadline", null: false, unsigned: true
    t.integer "created_time", null: false, unsigned: true
    t.index ["sess_deadline"], name: "sess_deadline"
    t.index ["sess_id"], name: "sess_id", unique: true
  end

  create_table "biz_targetlog", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "target_type", limit: 32, default: "", null: false, comment: "日志对象类型"
    t.string "target_id", limit: 48, default: "", null: false, comment: "日志对象ID"
    t.string "action", limit: 32, default: "", null: false, comment: "日志行为"
    t.integer "level", limit: 2, default: 0, null: false, comment: "日志等级"
    t.text "message", limit: 4294967295, null: false, comment: "日志信息"
    t.text "context", limit: 4294967295, null: false, comment: "日志上下文"
    t.integer "user_id", default: 0, null: false, comment: "操作人ID", unsigned: true
    t.string "ip", limit: 32, default: "", null: false, comment: "操作人IP"
    t.integer "created_time", default: 0, null: false, comment: "创建时间", unsigned: true
    t.index ["level"], name: "idx_level"
    t.index ["target_type", "target_id"], name: "idx_target", length: 8
  end

  create_table "biz_token", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "place", limit: 32, default: "", null: false, comment: "使用场景"
    t.string "_key", limit: 32, default: "", null: false, comment: "KEY"
    t.text "data", null: false, comment: "数据"
    t.integer "expired_time", default: 0, null: false, comment: "过期时间", unsigned: true
    t.integer "times", default: 0, null: false, comment: "最多可被校验的次数", unsigned: true
    t.integer "remaining_times", default: 0, null: false, comment: "剩余可被校验的次数", unsigned: true
    t.integer "created_time", null: false, comment: "创建时间", unsigned: true
    t.index ["_key"], name: "_key", unique: true
    t.index ["expired_time"], name: "expired_time"
  end

  create_table "blacklist", id: :integer, comment: "id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "黑名单表", force: :cascade do |t|
    t.integer "userId", null: false, comment: "名单拥有者id", unsigned: true
    t.integer "blackId", null: false, comment: "黑名单用户id", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "加入黑名单时间", unsigned: true
  end

  create_table "blazer_audits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.timestamp "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.string "check_type"
    t.text "message"
    t.timestamp "last_run_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "creator_id"
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

  create_table "block", id: :integer, comment: "编辑区ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", null: false, comment: "编辑区创建人ID"
    t.text "content", comment: "编辑区内容"
    t.string "code", default: "", null: false
    t.text "data", comment: "编辑区内容"
    t.integer "createdTime", null: false, comment: "编辑区创建时间", unsigned: true
    t.integer "updateTime", default: 0, null: false, comment: "编辑区最后更新时间", unsigned: true
    t.integer "orgId", default: 1, null: false, comment: "组织机构Id"
    t.integer "blockTemplateId", null: false, comment: "模版ID"
    t.text "meta"
    t.index ["code", "orgId"], name: "block_code_orgId_index"
  end

  create_table "block_history", id: :integer, comment: "编辑区历史记录ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "历史表", force: :cascade do |t|
    t.integer "blockId", null: false, comment: "编辑区ID"
    t.text "templateData", comment: "模板历史数据"
    t.text "data", comment: "block元信息"
    t.text "content", comment: "编辑区历史内容"
    t.integer "userId", null: false, comment: "编辑区编辑人ID"
    t.integer "createdTime", null: false, comment: "编辑区历史记录创建时间", unsigned: true
  end

  create_table "block_template", id: :integer, comment: "模版ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "编辑区模板", force: :cascade do |t|
    t.string "title", null: false, comment: "标题"
    t.string "mode", limit: 8, default: "html", null: false, comment: "模式"
    t.text "template", comment: "模板"
    t.string "templateName", comment: "编辑区模板名字"
    t.text "templateData", comment: "模板数据"
    t.text "content", comment: "默认内容"
    t.text "data", comment: "编辑区内容"
    t.string "code", default: "", null: false, comment: "编辑区编码"
    t.text "meta", comment: "编辑区元信息"
    t.string "tips"
    t.string "category", limit: 60, default: "system", null: false, comment: "分类(系统/主题)"
    t.integer "createdTime", null: false, comment: "创建时间", unsigned: true
    t.integer "updateTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.index ["code"], name: "code", unique: true
  end

  create_table "cache", id: :integer, comment: "缓存ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 128, default: "", null: false, comment: "缓存名称"
    t.binary "data", limit: 4294967295, comment: "缓存数据"
    t.integer "serialized", limit: 1, default: 0, null: false, comment: "缓存是否为序列化的标记位", unsigned: true
    t.integer "expiredTime", default: 0, null: false, comment: "缓存过期时间", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "缓存创建时间", unsigned: true
    t.index ["expiredTime"], name: "expiredTime"
    t.index ["name"], name: "name", unique: true
  end

  create_table "card", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cardId", default: "", null: false, comment: "卡的ID"
    t.string "cardType", default: "", null: false, comment: "卡的类型"
    t.integer "deadline", default: 0, null: false, comment: "到期时间", unsigned: true
    t.integer "useTime", default: 0, null: false, comment: "使用时间", unsigned: true
    t.string "status", limit: 7, default: "receive", null: false, comment: "使用状态"
    t.integer "userId", default: 0, null: false, comment: "使用者", unsigned: true
    t.integer "createdTime", null: false, comment: "领取时间", unsigned: true
  end

  create_table "cash_account", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", null: false, unsigned: true
    t.float "cash", default: 0.0, null: false
    t.index ["userId"], name: "userId", unique: true
  end

  create_table "cash_change", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", null: false, unsigned: true
    t.float "amount", limit: 53, default: 0.0, null: false
  end

  create_table "cash_flow", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "帐目流水", force: :cascade do |t|
    t.integer "userId", null: false, comment: "账号ID，即用户ID", unsigned: true
    t.bigint "sn", null: false, comment: "账目流水号", unsigned: true
    t.string "type", limit: 7, null: false, comment: "流水类型"
    t.float "amount", default: 0.0, null: false, comment: "金额"
    t.string "cashType", limit: 4, default: "Coin", null: false, comment: "账单类型"
    t.float "cash", default: 0.0, null: false, comment: "账单生成后的余额"
    t.bigint "parentSn", comment: "上一个账单的流水号"
    t.string "name", limit: 1024, default: "", null: false, comment: "帐目名称"
    t.string "orderSn", limit: 40, null: false, comment: "订单号"
    t.string "category", limit: 128, default: "", null: false, comment: "帐目类目"
    t.string "payment", limit: 32, default: ""
    t.text "note", comment: "备注"
    t.integer "createdTime", null: false, unsigned: true
    t.index ["sn"], name: "tradeNo", unique: true
  end

  create_table "cash_orders", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sn", limit: 32, null: false, comment: "订单号"
    t.string "status", limit: 9, null: false
    t.string "title", null: false
    t.float "amount", default: 0.0, null: false, unsigned: true
    t.string "payment", limit: 32, default: "none", null: false
    t.integer "paidTime", default: 0, null: false, unsigned: true
    t.string "note", default: "", null: false
    t.integer "userId", default: 0, null: false, unsigned: true
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.string "targetType", limit: 64, default: "coin", null: false, comment: "订单类型"
    t.string "token", limit: 50, comment: "令牌"
    t.text "data", comment: "订单业务数据"
    t.index ["sn"], name: "sn", unique: true
  end

  create_table "cash_orders_log", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "orderId", null: false, unsigned: true
    t.text "message"
    t.text "data"
    t.integer "userId", default: 0, null: false, unsigned: true
    t.string "ip", null: false
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.string "type", default: "", null: false
  end

  create_table "category", id: :integer, comment: "分类ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code", limit: 64, default: "", null: false, comment: "分类编码"
    t.string "name", null: false, comment: "分类名称"
    t.string "icon", default: "", null: false, comment: "图标"
    t.string "path", default: "", null: false, comment: "分类完整路径"
    t.integer "weight", default: 0, null: false, comment: "分类权重"
    t.integer "groupId", null: false, comment: "分类组ID", unsigned: true
    t.integer "parentId", default: 0, null: false, comment: "父分类ID", unsigned: true
    t.text "description"
    t.integer "orgId", default: 1, unsigned: true
    t.string "orgCode", default: "1.", comment: "组织机构内部编码"
    t.index ["code"], name: "uri", unique: true
  end

  create_table "category_group", id: :integer, comment: "分类组ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code", limit: 64, null: false, comment: "分类组编码"
    t.string "name", null: false, comment: "分类组名称"
    t.integer "depth", limit: 1, default: 1, null: false, comment: "该组下分类允许的最大层级数", unsigned: true
  end

  create_table "classroom", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false, comment: "标题"
    t.string "status", limit: 9, default: "draft", null: false, comment: "状态关闭，未发布，发布"
    t.text "about", comment: "简介"
    t.integer "categoryId", default: 0, null: false, comment: "分类id"
    t.text "description", comment: "课程说明"
    t.float "price", default: 0.0, null: false, comment: "价格", unsigned: true
    t.integer "vipLevelId", default: 0, null: false, comment: "支持的vip等级", unsigned: true
    t.string "smallPicture", default: "", null: false, comment: "小图"
    t.string "middlePicture", default: "", null: false, comment: "中图"
    t.string "largePicture", default: "", null: false, comment: "大图"
    t.integer "headTeacherId", default: 0, null: false, comment: "班主任ID", unsigned: true
    t.string "teacherIds", default: "", null: false, comment: "教师IDs"
    t.text "assistantIds", comment: "助教Ids"
    t.integer "hitNum", default: 0, null: false, comment: "点击数", unsigned: true
    t.integer "auditorNum", default: 0, null: false, comment: "旁听生数", unsigned: true
    t.integer "studentNum", default: 0, null: false, comment: "学员数", unsigned: true
    t.integer "courseNum", default: 0, null: false, comment: "课程数", unsigned: true
    t.integer "lessonNum", default: 0, null: false, comment: "课时数", unsigned: true
    t.integer "threadNum", default: 0, null: false, comment: "话题数", unsigned: true
    t.integer "noteNum", default: 0, null: false, comment: "班级笔记数量", unsigned: true
    t.integer "postNum", default: 0, null: false, comment: "回复数", unsigned: true
    t.float "rating", default: 0.0, null: false, comment: "排行数值", unsigned: true
    t.integer "ratingNum", default: 0, null: false, comment: "投票人数", unsigned: true
    t.integer "hotSeq", default: 0, null: false, comment: "最热排序", unsigned: true
    t.float "income", default: 0.0, null: false, comment: "收入"
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "更新时间", unsigned: true
    t.string "service", comment: "班级服务"
    t.integer "private", limit: 1, default: 0, null: false, comment: "是否封闭班级", unsigned: true
    t.boolean "recommended", default: false, null: false, comment: "是否为推荐班级", unsigned: true
    t.integer "recommendedSeq", default: 100, null: false, comment: "推荐序号", unsigned: true
    t.integer "recommendedTime", default: 0, null: false, comment: "推荐时间", unsigned: true
    t.integer "maxRate", limit: 1, default: 100, null: false, comment: "最大抵扣百分比", unsigned: true
    t.boolean "showable", default: true, null: false, comment: "是否开放展示", unsigned: true
    t.boolean "buyable", default: true, null: false, comment: "是否开放购买", unsigned: true
    t.string "conversationId", default: "0", null: false
    t.integer "orgId", default: 1, unsigned: true
    t.string "orgCode", default: "1.", comment: "组织机构内部编码"
    t.string "expiryMode", limit: 32, default: "forever", null: false, comment: "学习有效期模式：date、days、forever"
    t.integer "expiryValue", default: 0, null: false, comment: "有效期"
    t.integer "creator", default: 0, null: false, comment: "班级创建者"
  end

  create_table "classroom_courses", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "classroomId", null: false, comment: "班级ID", unsigned: true
    t.integer "courseId", null: false, comment: "课程ID", unsigned: true
    t.integer "parentCourseId", null: false, comment: "父课程Id", unsigned: true
    t.integer "seq", default: 0, null: false, comment: "班级课程顺序", unsigned: true
    t.boolean "disabled", default: false, null: false, comment: "是否禁用", unsigned: true
    t.integer "courseSetId", default: 0, null: false, comment: "课程ID"
  end

  create_table "classroom_member", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "classroomId", default: 0, null: false, comment: "班级ID", unsigned: true
    t.integer "userId", default: 0, null: false, comment: "用户ID", unsigned: true
    t.integer "orderId", default: 0, null: false, comment: "订单ID", unsigned: true
    t.integer "levelId", default: 0, null: false, comment: "等级", unsigned: true
    t.integer "noteNum", default: 0, null: false, comment: "笔记数", unsigned: true
    t.integer "threadNum", default: 0, null: false, comment: "话题数", unsigned: true
    t.integer "locked", limit: 1, default: 0, null: false, comment: "学员是否被锁定", unsigned: true
    t.text "remark", comment: "备注"
    t.string "role", default: "auditor", null: false, comment: "角色"
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "lastLearnTime", comment: "最后学习时间"
    t.integer "learnedNum", comment: "已学课时数"
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间"
    t.integer "deadline", default: 0, null: false, comment: "到期时间", unsigned: true
    t.integer "refundDeadline", default: 0, null: false, comment: "退款截止时间"
    t.integer "deadlineNotified", default: 0, null: false, comment: "有效期通知"
    t.index ["classroomId"], name: "classroomId"
  end

  create_table "classroom_review", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", default: 0, null: false, comment: "用户ID", unsigned: true
    t.integer "classroomId", default: 0, null: false, comment: "班级ID", unsigned: true
    t.string "title", default: "", null: false, comment: "标题"
    t.text "content", null: false, comment: "内容"
    t.integer "rating", default: 0, null: false, comment: "评分0-5", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "parentId", default: 0, null: false, comment: "回复ID"
    t.integer "updatedTime"
    t.text "meta", comment: "评价元信息"
  end

  create_table "cloud_app", id: :integer, comment: "云应用ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "已安装的应用", force: :cascade do |t|
    t.string "name", null: false, comment: "云应用名称"
    t.string "code", limit: 64, null: false, comment: "云应用编码"
    t.string "type", limit: 64, default: "plugin", null: false, comment: "应用类型(core系统，plugin插件应用, theme主题应用)"
    t.integer "protocol", limit: 1, default: 2, null: false, unsigned: true
    t.text "description", null: false, comment: "云应用描述"
    t.string "icon", null: false, comment: "云应用图标"
    t.string "version", limit: 32, null: false, comment: "云应用当前版本"
    t.string "fromVersion", limit: 32, default: "0.0.0", null: false, comment: "云应用更新前版本"
    t.integer "developerId", default: 0, null: false, comment: "云应用开发者用户ID", unsigned: true
    t.string "developerName", default: "", null: false, comment: "云应用开发者名称"
    t.integer "installedTime", default: 0, null: false, comment: "云应用安装时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "云应用最后更新时间", unsigned: true
    t.string "edusohoMinVersion", limit: 32, default: "0.0.0", null: false, comment: "依赖Edusoho的最小版本"
    t.string "edusohoMaxVersion", limit: 32, default: "up", null: false, comment: "依赖Edusoho的最大版本"
    t.index ["code"], name: "code", unique: true
  end

  create_table "cloud_app_logs", id: :integer, comment: "云应用运行日志ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "应用升级日志", force: :cascade do |t|
    t.string "code", limit: 32, default: "", null: false, comment: "应用编码"
    t.string "name", limit: 32, default: "", null: false, comment: "应用名称"
    t.string "fromVersion", limit: 32, comment: "升级前版本"
    t.string "toVersion", limit: 32, default: "", null: false, comment: "升级后版本"
    t.string "type", limit: 7, default: "install", null: false, comment: "升级类型"
    t.string "dbBackupPath", default: "", null: false, comment: "数据库备份文件"
    t.string "sourceBackupPath", default: "", null: false, comment: "源文件备份地址"
    t.string "status", limit: 32, null: false, comment: "升级状态(ROLLBACK,ERROR,SUCCESS,RECOVERED)"
    t.integer "userId", default: 0, null: false, comment: "管理员ID", unsigned: true
    t.string "ip", limit: 32, default: "", null: false, comment: "IP"
    t.text "message", comment: "失败原因"
    t.integer "createdTime", null: false, comment: "日志记录时间", unsigned: true
  end

  create_table "cloud_data", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "body", null: false
    t.integer "timestamp", null: false, unsigned: true
    t.integer "createdTime", null: false, unsigned: true
    t.integer "updatedTime", null: false, unsigned: true
    t.integer "createdUserId", null: false, unsigned: true
  end

  create_table "comment", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "objectType", limit: 32, null: false
    t.integer "objectId", null: false, unsigned: true
    t.integer "userId", default: 0, null: false, unsigned: true
    t.text "content", null: false
    t.integer "createdTime", null: false, unsigned: true
    t.index ["objectType", "objectId"], name: "objectType"
  end

  create_table "content", id: :integer, comment: "内容ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false, comment: "内容标题"
    t.string "editor", limit: 10, default: "richeditor", null: false, comment: "编辑器选择类型字段"
    t.string "type", null: false, comment: "内容类型"
    t.string "alias", default: "", null: false, comment: "内容别名"
    t.text "summary", comment: "内容摘要"
    t.text "body", comment: "内容正文"
    t.string "picture", default: "", null: false, comment: "内容头图"
    t.string "template", default: "", null: false, comment: "内容模板"
    t.string "status", limit: 11, null: false, comment: "内容状态"
    t.integer "categoryId", default: 0, null: false, comment: "内容分类ID", unsigned: true
    t.text "tagIds", limit: 255, comment: "内容标签ID"
    t.integer "hits", default: 0, null: false, comment: "内容点击量", unsigned: true
    t.integer "featured", default: 0, null: false, comment: "是否头条", unsigned: true
    t.integer "promoted", limit: 1, default: 1, null: false, comment: "是否推荐", unsigned: true
    t.integer "sticky", limit: 1, default: 0, null: false, comment: "是否置顶", unsigned: true
    t.integer "userId", null: false, comment: "发布人ID", unsigned: true
    t.text "field1", comment: "扩展字段"
    t.text "field2", comment: "扩展字段"
    t.text "field3", comment: "扩展字段"
    t.text "field4", comment: "扩展字段"
    t.text "field5", comment: "扩展字段"
    t.text "field6", comment: "扩展字段"
    t.text "field7", comment: "扩展字段"
    t.text "field8", comment: "扩展字段"
    t.text "field9", comment: "扩展字段"
    t.text "field10", comment: "扩展字段"
    t.integer "publishedTime", default: 0, null: false, comment: "发布时间", unsigned: true
    t.integer "createdTime", null: false, comment: "创建时间", unsigned: true
  end

  create_table "coupon", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "优惠码表", force: :cascade do |t|
    t.string "code", null: false, comment: "优惠码"
    t.string "type", limit: 8, null: false, comment: "优惠方式"
    t.string "status", limit: 7, default: "unused", null: false
    t.float "rate", null: false, comment: "若优惠方式为打折，则为打折率，若为抵价，则为抵价金额", unsigned: true
    t.integer "batchId", comment: "批次号", unsigned: true
    t.integer "userId", default: 0, null: false, comment: "使用者", unsigned: true
    t.integer "deadline", null: false, comment: "失效时间", unsigned: true
    t.string "targetType", limit: 64, comment: "使用对象类型"
    t.integer "targetId", default: 0, null: false, comment: "使用对象", unsigned: true
    t.integer "orderId", default: 0, null: false, comment: "订单号", unsigned: true
    t.integer "orderTime", default: 0, null: false, comment: "使用时间", unsigned: true
    t.integer "createdTime", null: false, unsigned: true
    t.integer "receiveTime", default: 0, null: false, comment: "接收时间", unsigned: true
    t.float "fullDiscountPrice", unsigned: true
    t.index ["code"], name: "code"
  end

  create_table "coupon_batch", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "优惠码批次表", force: :cascade do |t|
    t.string "name", limit: 64, null: false, comment: "批次名称"
    t.string "token", limit: 64, default: "0", null: false
    t.string "type", limit: 8, null: false, comment: "优惠方式"
    t.integer "generatedNum", default: 0, null: false, comment: "生成数", unsigned: true
    t.integer "usedNum", default: 0, null: false, comment: "使用次数"
    t.float "rate", null: false, comment: "若优惠方式为打折，则为打折率，若为抵价，则为抵价金额", unsigned: true
    t.string "prefix", limit: 64, null: false, comment: "批次前缀"
    t.integer "digits", null: false, comment: "优惠码位数", unsigned: true
    t.float "money", default: 0.0, null: false, comment: "已优惠金额"
    t.integer "deadline", null: false, comment: "失效时间", unsigned: true
    t.string "targetType", limit: 64, default: "", null: false, comment: "使用对象类型"
    t.integer "targetId", default: 0, null: false, unsigned: true
    t.text "description", comment: "优惠说明"
    t.integer "createdTime", null: false, unsigned: true
    t.float "fullDiscountPrice", unsigned: true
  end

  create_table "course", id: :integer, comment: "课程ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 1024, null: false, comment: "课程标题"
    t.string "subtitle", limit: 1024, default: "", null: false, comment: "课程副标题"
    t.string "status", limit: 9, default: "draft", null: false, comment: "课程状态"
    t.boolean "buyable", default: true, null: false, comment: "是否开放购买", unsigned: true
    t.integer "buyExpiryTime", default: 0, null: false, comment: "购买开放有效期", unsigned: true
    t.string "type", default: "normal", null: false, comment: "课程类型"
    t.integer "maxStudentNum", default: 0, null: false, comment: "直播课程最大学员数上线"
    t.float "price", default: 0.0, null: false, comment: "课程价格"
    t.float "originPrice", default: 0.0, null: false, comment: "课程人民币原价"
    t.float "coinPrice", default: 0.0, null: false
    t.float "originCoinPrice", default: 0.0, null: false, comment: "课程虚拟币原价"
    t.string "expiryMode", limit: 4, default: "none", null: false, comment: "有效期模式（截止日期|有效期天数|不设置）"
    t.integer "expiryDay", default: 0, null: false, comment: "课程过期天数", unsigned: true
    t.string "showStudentNumType", limit: 6, default: "opened", null: false, comment: "学员数显示模式"
    t.string "serializeMode", limit: 9, default: "none", null: false, comment: "连载模式"
    t.float "income", default: 0.0, null: false, comment: "课程销售总收入"
    t.integer "lessonNum", default: 0, null: false, comment: "课时数", unsigned: true
    t.integer "giveCredit", default: 0, null: false, comment: "学完课程所有课时，可获得的总学分", unsigned: true
    t.integer "rating", default: 0, null: false, comment: "排行分数", unsigned: true
    t.integer "ratingNum", default: 0, null: false, comment: "投票人数", unsigned: true
    t.integer "vipLevelId", default: 0, null: false, comment: "可以免费看的，会员等级", unsigned: true
    t.integer "categoryId", default: 0, null: false, comment: "分类ID", unsigned: true
    t.text "tags", comment: "标签IDs"
    t.string "smallPicture", default: "", null: false, comment: "小图"
    t.string "middlePicture", default: "", null: false, comment: "中图"
    t.string "largePicture", default: "", null: false, comment: "大图"
    t.text "about", comment: "简介"
    t.text "teacherIds", comment: "显示的课程教师IDs"
    t.text "goals", comment: "课程目标"
    t.text "audiences", comment: "适合人群"
    t.integer "recommended", limit: 1, default: 0, null: false, comment: "是否为推荐课程", unsigned: true
    t.integer "recommendedSeq", default: 0, null: false, comment: "推荐序号", unsigned: true
    t.integer "recommendedTime", default: 0, null: false, comment: "推荐时间", unsigned: true
    t.integer "locationId", default: 0, null: false, comment: "上课地区ID", unsigned: true
    t.integer "parentId", default: 0, null: false, comment: "课程的父Id", unsigned: true
    t.string "address", default: "", null: false, comment: "上课地区地址"
    t.integer "studentNum", default: 0, null: false, comment: "学员数", unsigned: true
    t.integer "hitNum", default: 0, null: false, comment: "查看次数", unsigned: true
    t.integer "noteNum", default: 0, null: false, comment: "课程笔记数量", unsigned: true
    t.integer "userId", null: false, comment: "课程发布人ID", unsigned: true
    t.integer "discountId", default: 0, null: false, comment: "折扣活动ID", unsigned: true
    t.float "discount", default: 10.0, null: false, comment: "折扣"
    t.string "deadlineNotify", limit: 6, default: "none", null: false, comment: "开启有效期通知"
    t.integer "daysOfNotifyBeforeDeadline", default: 0, null: false
    t.integer "watchLimit", default: 0, null: false, comment: "课时观看次数限制", unsigned: true
    t.string "useInClassroom", limit: 6, default: "single", null: false, comment: "课程能否用于多个班级"
    t.integer "singleBuy", default: 1, null: false, comment: "加入班级后课程能否单独购买", unsigned: true
    t.integer "createdTime", null: false, comment: "课程创建时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.integer "freeStartTime", default: 0, null: false
    t.integer "freeEndTime", default: 0, null: false
    t.boolean "approval", default: false, null: false, comment: "是否需要实名认证", unsigned: true
    t.integer "locked", default: 0, null: false, comment: "是否上锁1上锁,0解锁"
    t.integer "maxRate", limit: 1, default: 100, null: false, comment: "最大抵扣百分比", unsigned: true
    t.integer "tryLookable", limit: 1, default: 0, null: false
    t.integer "tryLookTime", default: 0, null: false
    t.string "conversationId", default: "0", null: false
    t.integer "orgId", default: 1, unsigned: true
    t.string "orgCode", default: "1.", comment: "组织机构内部编码"
    t.index ["updatedTime"], name: "updatedTime"
  end

  create_table "course_chapter", id: :integer, comment: "课程章节ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "courseId", null: false, comment: "章节所属课程ID", unsigned: true
    t.string "type", default: "chapter", null: false, comment: "章节类型：chapter为章节，unit为单元，lesson为课时。"
    t.integer "number", default: 1, null: false, comment: "章节编号", unsigned: true
    t.integer "seq", default: 1, null: false, comment: "章节序号", unsigned: true
    t.string "title", null: false, comment: "章节名称"
    t.integer "createdTime", null: false, comment: "章节创建时间", unsigned: true
    t.integer "copyId", default: 0, null: false, comment: "复制章节的id"
    t.integer "migrateLessonId", default: 0
    t.integer "migrateCopyCourseId", default: 0
    t.integer "migrateRefTaskId", default: 0
    t.integer "mgrateCopyTaskId", default: 0
  end

  create_table "course_chapter_8_0_19_backup", id: :integer, comment: "课程章节ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "courseId", null: false, comment: "章节所属课程ID", unsigned: true
    t.string "type", default: "chapter", null: false, comment: "章节类型：chapter为章节，unit为单元，lesson为课时。"
    t.integer "parentId", default: 0, null: false, comment: "parentId大于０时为单元", unsigned: true
    t.integer "number", null: false, comment: "章节编号", unsigned: true
    t.integer "seq", null: false, comment: "章节序号", unsigned: true
    t.string "title", null: false, comment: "章节名称"
    t.integer "createdTime", null: false, comment: "章节创建时间", unsigned: true
    t.integer "copyId", default: 0, null: false, comment: "复制章节的id"
    t.integer "migrateLessonId", default: 0
    t.integer "migrateCopyCourseId", default: 0
    t.integer "migrateRefTaskId", default: 0
    t.integer "mgrateCopyTaskId", default: 0
  end

  create_table "course_draft", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false, comment: "标题"
    t.text "summary", comment: "摘要"
    t.integer "courseId", null: false, comment: "课程ID", unsigned: true
    t.text "content", comment: "内容"
    t.integer "userId", null: false, comment: "用户ID", unsigned: true
    t.integer "activityId", null: false, comment: "教学活动ID", unsigned: true
    t.integer "createdTime", null: false, comment: "创建时间", unsigned: true
  end

  create_table "course_favorite", id: :integer, comment: "收藏ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "用户的收藏数据表", force: :cascade do |t|
    t.integer "courseId", null: false, comment: "教学计划ID", unsigned: true
    t.integer "userId", null: false, comment: "收藏人的ID", unsigned: true
    t.integer "createdTime", null: false, comment: "创建时间"
    t.string "type", limit: 50, default: "course", null: false, comment: "课程类型"
    t.integer "courseSetId", default: 0, null: false, comment: "课程ID"
    t.index ["userId", "courseId", "type"], name: "course_favorite_userId_courseId_type_index"
  end

  create_table "course_job", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "课程定时任务表", force: :cascade do |t|
    t.integer "courseId", null: false, comment: "计划Id", unsigned: true
    t.string "type", limit: 32, default: "", null: false, comment: "任务类型"
    t.text "data", comment: "任务参数"
  end

  create_table "course_lesson", id: :integer, comment: "课时ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "courseId", null: false, comment: "课时所属课程ID", unsigned: true
    t.integer "chapterId", default: 0, null: false, comment: "课时所属章节ID", unsigned: true
    t.integer "number", null: false, comment: "课时编号", unsigned: true
    t.integer "seq", null: false, comment: "课时在课程中的序号", unsigned: true
    t.integer "free", limit: 1, default: 0, null: false, comment: "是否为免费课时", unsigned: true
    t.string "status", limit: 11, default: "published", null: false, comment: "课时状态"
    t.string "title", null: false, comment: "课时标题"
    t.text "summary", comment: "课时摘要"
    t.text "tags", comment: "课时标签"
    t.string "type", limit: 64, default: "text", null: false, comment: "课时类型"
    t.text "content", comment: "课时正文"
    t.integer "giveCredit", default: 0, null: false, comment: "学完课时获得的学分", unsigned: true
    t.integer "requireCredit", default: 0, null: false, comment: "学习课时前，需达到的学分", unsigned: true
    t.integer "mediaId", default: 0, null: false, comment: "媒体文件ID", unsigned: true
    t.string "mediaSource", limit: 32, default: "", null: false, comment: "媒体文件来源(self:本站上传,youku:优酷)"
    t.string "mediaName", default: "", null: false, comment: "媒体文件名称"
    t.text "mediaUri", comment: "媒体文件资源名"
    t.integer "homeworkId", default: 0, null: false, comment: "作业iD", unsigned: true
    t.integer "exerciseId", default: 0, comment: "练习ID", unsigned: true
    t.integer "length", comment: "时长", unsigned: true
    t.integer "materialNum", default: 0, null: false, comment: "上传的资料数量", unsigned: true
    t.integer "quizNum", default: 0, null: false, comment: "测验题目数量", unsigned: true
    t.integer "learnedNum", default: 0, null: false, comment: "已学的学员数", unsigned: true
    t.integer "viewedNum", default: 0, null: false, comment: "查看数", unsigned: true
    t.integer "startTime", default: 0, null: false, comment: "直播课时开始时间", unsigned: true
    t.integer "endTime", default: 0, null: false, comment: "直播课时结束时间", unsigned: true
    t.integer "memberNum", default: 0, null: false, comment: "直播课时加入人数", unsigned: true
    t.string "replayStatus", limit: 14, default: "ungenerated", null: false
    t.integer "maxOnlineNum", default: 0, comment: "直播在线人数峰值"
    t.integer "liveProvider", default: 0, null: false, unsigned: true
    t.integer "userId", null: false, comment: "发布人ID", unsigned: true
    t.integer "createdTime", null: false, comment: "创建时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.integer "copyId", default: 0, null: false, comment: "复制课时id"
    t.string "testMode", limit: 8, default: "normal", comment: "考试模式"
    t.integer "testStartTime", default: 0, comment: "实时考试开始时间"
    t.index ["updatedTime"], name: "updatedTime"
  end

  create_table "course_lesson_extend", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "试卷课时扩展表", force: :cascade do |t|
    t.integer "id", null: false, comment: "课时ID"
    t.integer "courseId", default: 0, null: false, comment: "课程ID"
    t.integer "doTimes", default: 0, null: false, comment: "可考试次数"
    t.float "redoInterval", default: 0.0, null: false, comment: "重做时间间隔(小时)"
  end

  create_table "course_lesson_learn", id: :integer, comment: "学员课时学习记录ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", null: false, comment: "学员ID", unsigned: true
    t.integer "courseId", null: false, comment: "课程ID", unsigned: true
    t.integer "lessonId", null: false, comment: "课时ID", unsigned: true
    t.string "status", limit: 8, null: false, comment: "学习状态"
    t.integer "startTime", default: 0, null: false, comment: "学习开始时间", unsigned: true
    t.integer "finishedTime", default: 0, null: false, comment: "学习完成时间", unsigned: true
    t.integer "learnTime", default: 0, null: false, comment: "学习时间", unsigned: true
    t.integer "watchTime", default: 0, null: false, comment: "学习观看时间", unsigned: true
    t.integer "watchNum", default: 0, null: false, comment: "课时已观看次数", unsigned: true
    t.string "videoStatus", limit: 7, default: "paused", null: false, comment: "学习观看时间"
    t.integer "updateTime", default: 0, null: false, comment: "更新时间", unsigned: true
    t.index ["userId", "courseId"], name: "userId_courseId"
    t.index ["userId", "lessonId"], name: "userId_lessonId", unique: true
  end

  create_table "course_lesson_replay", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "lessonId", null: false, comment: "所属课时", unsigned: true
    t.integer "courseId", null: false, comment: "所属课程", unsigned: true
    t.string "title", null: false, comment: "名称"
    t.text "replayId", null: false, comment: "云直播中的回放id"
    t.string "globalId", limit: 32, default: "", null: false, comment: "云资源ID"
    t.integer "userId", null: false, comment: "创建者", unsigned: true
    t.integer "createdTime", null: false, comment: "创建时间", unsigned: true
    t.boolean "hidden", default: false, comment: "观看状态", unsigned: true
    t.string "type", limit: 50, default: "live", null: false, comment: "课程类型"
    t.integer "copyId", default: 0, comment: "复制回放的ID"
  end

  create_table "course_lesson_view", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "courseId", null: false
    t.integer "lessonId", null: false
    t.integer "fileId", null: false
    t.integer "userId", null: false
    t.string "fileType", limit: 8, default: "none", null: false
    t.string "fileStorage", limit: 5, default: "none", null: false
    t.string "fileSource", limit: 32, null: false
    t.integer "createdTime", null: false, unsigned: true
  end

  create_table "course_material", id: :integer, comment: "课程资料ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "courseId", default: 0, null: false, comment: "资料所属课程ID", unsigned: true
    t.integer "lessonId", default: 0, null: false, comment: "资料所属课时ID", unsigned: true
    t.string "title", limit: 1024, null: false, comment: "资料标题"
    t.text "description", comment: "资料描述"
    t.string "link", limit: 1024, default: "", null: false, comment: "外部链接地址"
    t.integer "fileId", null: false, comment: "资料文件ID", unsigned: true
    t.string "fileUri", default: "", null: false, comment: "资料文件URI"
    t.string "fileMime", default: "", null: false, comment: "资料文件MIME"
    t.integer "fileSize", default: 0, null: false, comment: "资料文件大小", unsigned: true
    t.string "source", limit: 50, default: "coursematerial", null: false
    t.integer "userId", default: 0, null: false, comment: "资料创建人ID", unsigned: true
    t.integer "createdTime", null: false, comment: "资料创建时间", unsigned: true
    t.integer "copyId", default: 0, null: false, comment: "复制的资料Id"
    t.string "type", limit: 50, default: "course", null: false, comment: "课程类型"
    t.integer "courseSetId"
  end

  create_table "course_material_v8", id: :integer, comment: "课程资料ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "courseId", default: 0, null: false, comment: "资料所属课程ID", unsigned: true
    t.integer "lessonId", default: 0, null: false, comment: "资料所属课时ID", unsigned: true
    t.string "title", limit: 1024, null: false, comment: "资料标题"
    t.text "description", comment: "资料描述"
    t.string "link", limit: 1024, default: "", null: false, comment: "外部链接地址"
    t.integer "fileId", null: false, comment: "资料文件ID", unsigned: true
    t.string "fileUri", default: "", null: false, comment: "资料文件URI"
    t.string "fileMime", default: "", null: false, comment: "资料文件MIME"
    t.integer "fileSize", default: 0, null: false, comment: "资料文件大小", unsigned: true
    t.string "source", limit: 50, default: "coursematerial", null: false
    t.integer "userId", default: 0, null: false, comment: "资料创建人ID", unsigned: true
    t.integer "createdTime", null: false, comment: "资料创建时间", unsigned: true
    t.integer "copyId", default: 0, null: false, comment: "复制的资料Id"
    t.string "type", limit: 50, default: "course", null: false, comment: "课程类型"
    t.integer "courseSetId", default: 0, null: false, unsigned: true
  end

  create_table "course_member", id: :integer, comment: "课程学员记录ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "courseId", null: false, comment: "教学计划ID", unsigned: true
    t.integer "classroomId", default: 0, null: false, comment: "班级ID"
    t.string "joinedType", limit: 9, default: "course", null: false, comment: "购买班级或者课程加入学习"
    t.integer "userId", null: false, comment: "学员ID", unsigned: true
    t.integer "orderId", default: 0, null: false, comment: "学员购买课程时的订单ID", unsigned: true
    t.integer "deadline", default: 0, null: false, comment: "学习最后期限", unsigned: true
    t.integer "refundDeadline", default: 0, null: false, comment: "退款截止时间"
    t.integer "levelId", default: 0, null: false, comment: "用户以会员的方式加入课程学员时的会员ID", unsigned: true
    t.integer "learnedNum", default: 0, null: false, comment: "已学课时数", unsigned: true
    t.integer "learnedCompulsoryTaskNum", default: 0, null: false, comment: "已学习的必修任务数量", unsigned: true
    t.integer "credit", default: 0, null: false, comment: "学员已获得的学分", unsigned: true
    t.integer "noteNum", default: 0, null: false, comment: "笔记数目", unsigned: true
    t.integer "noteLastUpdateTime", default: 0, null: false, comment: "最新的笔记更新时间", unsigned: true
    t.integer "isLearned", limit: 1, default: 0, null: false, comment: "是否已学完", unsigned: true
    t.integer "finishedTime", default: 0, null: false, comment: "完成课程时间", unsigned: true
    t.integer "seq", default: 0, null: false, comment: "排序序号", unsigned: true
    t.string "remark", default: "", null: false, comment: "备注"
    t.integer "isVisible", limit: 1, default: 1, null: false, comment: "可见与否，默认为可见"
    t.string "role", limit: 7, default: "student", null: false, comment: "课程会员角色"
    t.integer "locked", limit: 1, default: 0, null: false, comment: "学员是否被锁定", unsigned: true
    t.integer "deadlineNotified", default: 0, null: false, comment: "有效期通知"
    t.integer "createdTime", null: false, comment: "学员加入课程时间", unsigned: true
    t.integer "lastLearnTime", comment: "最后学习时间"
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间"
    t.integer "lastViewTime", default: 0, null: false, comment: "最后查看时间", unsigned: true
    t.integer "courseSetId", null: false, comment: "课程ID", unsigned: true
    t.index ["courseId", "role", "createdTime"], name: "courseId_role_createdTime"
    t.index ["courseId", "userId"], name: "courseId", unique: true
    t.index ["courseSetId"], name: "courseSetId"
  end

  create_table "course_note", id: :integer, comment: "笔记ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", null: false, comment: "笔记作者ID"
    t.integer "courseId", default: 0, null: false, comment: "课程ID", unsigned: true
    t.integer "taskId", default: 0, null: false, comment: "任务ID", unsigned: true
    t.text "content", null: false, comment: "笔记内容"
    t.integer "length", default: 0, null: false, comment: "笔记内容的字数", unsigned: true
    t.integer "likeNum", default: 0, null: false, comment: "点赞人数", unsigned: true
    t.boolean "status", default: true, null: false, comment: "笔记状态：0:私有, 1:公开"
    t.integer "createdTime", null: false, comment: "笔记创建时间"
    t.integer "updatedTime", default: 0, null: false, comment: "笔记更新时间", unsigned: true
    t.integer "courseSetId", null: false, unsigned: true
  end

  create_table "course_note_like", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "noteId", null: false
    t.integer "userId", null: false
    t.integer "createdTime", null: false, comment: "创建时间", unsigned: true
  end

  create_table "course_review", id: :integer, comment: "课程评价ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", default: 0, null: false, comment: "评价人ID", unsigned: true
    t.integer "courseId", default: 0, null: false, comment: "被评价的课程ID", unsigned: true
    t.string "title", default: "", null: false, comment: "评价标题"
    t.text "content", null: false, comment: "评论内容"
    t.integer "rating", default: 0, null: false, comment: "评分", unsigned: true
    t.boolean "private", default: false, null: false, comment: "是否隐藏", unsigned: true
    t.integer "createdTime", null: false, comment: "评价创建时间", unsigned: true
    t.integer "parentId", default: 0, null: false, comment: "回复ID"
    t.integer "updatedTime"
    t.text "meta", comment: "评价元信息"
    t.integer "courseSetId", default: 0, null: false, unsigned: true
  end

  create_table "course_set_v8", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type", limit: 32, default: "", null: false
    t.string "title", limit: 1024, default: ""
    t.string "subtitle", limit: 1024, default: ""
    t.text "tags"
    t.integer "categoryId", default: 0, null: false
    t.text "summary"
    t.text "goals"
    t.text "audiences"
    t.boolean "isVip", default: false, null: false, comment: "是否是VIP课程", unsigned: true
    t.string "cover", limit: 1024
    t.string "status", limit: 32, default: "0", comment: "draft, published, closed"
    t.integer "creator", default: 0
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "更新时间", unsigned: true
    t.string "serializeMode", limit: 32, default: "none", null: false, comment: "none, serilized, finished"
    t.integer "ratingNum", default: 0, null: false, comment: "课程评论数", unsigned: true
    t.float "rating", default: 0.0, null: false, comment: "课程评分", unsigned: true
    t.integer "noteNum", default: 0, null: false, comment: "课程笔记数", unsigned: true
    t.integer "studentNum", default: 0, null: false, comment: "课程学员数", unsigned: true
    t.integer "hotSeq", default: 0, null: false, comment: "最热排序", unsigned: true
    t.integer "recommended", limit: 1, default: 0, null: false, comment: "是否为推荐课程", unsigned: true
    t.integer "recommendedSeq", default: 0, null: false, comment: "推荐序号", unsigned: true
    t.integer "recommendedTime", default: 0, null: false, comment: "推荐时间", unsigned: true
    t.integer "orgId", default: 1, null: false, comment: "组织机构ID", unsigned: true
    t.string "orgCode", default: "1.", null: false, comment: "组织机构内部编码"
    t.integer "discountId", default: 0, null: false, comment: "折扣活动ID", unsigned: true
    t.float "discount", default: 10.0, null: false, comment: "折扣"
    t.integer "hitNum", default: 0, null: false, comment: "课程点击数", unsigned: true
    t.integer "maxRate", limit: 1, default: 100, null: false, comment: "最大抵扣百分比", unsigned: true
    t.integer "materialNum", default: 0, null: false, comment: "上传的资料数量", unsigned: true
    t.integer "parentId", default: 0, null: false, comment: "是否班级课程", unsigned: true
    t.boolean "locked", default: false, null: false, comment: "是否锁住", unsigned: true
    t.float "minCoursePrice", default: 0.0, null: false, comment: "已发布教学计划的最低价格"
    t.float "maxCoursePrice", default: 0.0, null: false, comment: "已发布教学计划的最高价格"
    t.string "teacherIds", limit: 1024
    t.integer "defaultCourseId", default: 0, comment: "默认的计划ID", unsigned: true
  end

  create_table "course_task", id: :integer, comment: "主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "courseId", default: 0, null: false, comment: "所属课程的id", unsigned: true
    t.integer "fromCourseSetId", default: 0, null: false, unsigned: true
    t.integer "seq", default: 1, null: false, comment: "序号", unsigned: true
    t.integer "categoryId"
    t.integer "activityId", default: 0, null: false, comment: "引用的教学活动", unsigned: true
    t.string "title", null: false, comment: "标题"
    t.integer "isFree", default: 0, null: false, comment: "是否免费", unsigned: true
    t.integer "isOptional", default: 0, null: false, comment: "是否必修", unsigned: true
    t.integer "startTime", default: 0, null: false, comment: "开始时间", unsigned: true
    t.integer "endTime", default: 0, null: false, comment: "结束时间", unsigned: true
    t.string "status", default: "create", null: false, comment: "发布状态 create|publish|unpublish"
    t.integer "createdUserId", null: false, comment: "创建者", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.string "mode", limit: 60, comment: "任务模式"
    t.string "number", limit: 32, default: "", null: false, comment: "任务编号"
    t.string "type", limit: 50, null: false, comment: "任务类型"
    t.string "mediaSource", limit: 32, default: "", null: false, comment: "媒体文件来源(self:本站上传,youku:优酷)"
    t.integer "length", default: 0, null: false, comment: "若是视频类型，则表示时长；若是ppt，则表示页数；由具体的活动业务来定义", unsigned: true
    t.integer "maxOnlineNum", default: 0, comment: "任务最大可同时进行的人数，0为不限制", unsigned: true
    t.integer "copyId", default: 0, null: false, comment: "复制来源task的id"
    t.integer "migrateLessonId", default: 0
    t.index ["courseId"], name: "courseId"
    t.index ["migrateLessonId", "activityId"], name: "migrateLessonIdAndActivityId"
    t.index ["migrateLessonId", "type"], name: "migrateLessonIdAndType"
    t.index ["seq"], name: "seq"
  end

  create_table "course_task_8_0_22_backup", id: :integer, comment: "主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "courseId", default: 0, null: false, comment: "所属课程的id", unsigned: true
    t.integer "fromCourseSetId", default: 0, null: false, unsigned: true
    t.integer "seq", null: false, unsigned: true
    t.integer "categoryId"
    t.integer "activityId", default: 0, null: false, comment: "引用的教学活动", unsigned: true
    t.string "title", null: false, comment: "标题"
    t.integer "isFree", default: 0, null: false, comment: "是否免费", unsigned: true
    t.integer "isOptional", default: 0, null: false, comment: "是否必修", unsigned: true
    t.integer "startTime", default: 0, null: false, comment: "开始时间", unsigned: true
    t.integer "endTime", default: 0, null: false, comment: "结束时间", unsigned: true
    t.string "status", default: "create", null: false, comment: "发布状态 create|publish|unpublish"
    t.integer "createdUserId", null: false, comment: "创建者", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.string "mode", limit: 60, comment: "任务模式"
    t.string "number", limit: 32, default: "", null: false, comment: "任务编号"
    t.string "type", limit: 50, null: false, comment: "任务类型"
    t.string "mediaSource", limit: 32, default: "", null: false, comment: "媒体文件来源(self:本站上传,youku:优酷)"
    t.integer "length", default: 0, null: false, comment: "若是视频类型，则表示时长；若是ppt，则表示页数；由具体的活动业务来定义", unsigned: true
    t.integer "maxOnlineNum", default: 0, comment: "任务最大可同时进行的人数，0为不限制", unsigned: true
    t.integer "copyId", default: 0, null: false, comment: "复制来源task的id"
    t.integer "migrateLessonId", default: 0
  end

  create_table "course_task_result", id: :integer, comment: "主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "activityId", default: 0, null: false, comment: "活动的id", unsigned: true
    t.integer "courseId", default: 0, null: false, comment: "所属课程的id", unsigned: true
    t.integer "courseTaskId", default: 0, null: false, comment: "课程的任务id", unsigned: true
    t.integer "userId", default: 0, null: false, comment: "用户id", unsigned: true
    t.string "status", default: "start", null: false, comment: "任务状态，start，finish"
    t.integer "finishedTime", default: 0, null: false, comment: "完成时间", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.integer "time", default: 0, null: false, comment: "任务进行时长（分钟）", unsigned: true
    t.integer "watchTime", default: 0, null: false, unsigned: true
    t.index ["courseTaskId", "activityId"], name: "courseTaskId_activityId"
    t.index ["userId", "courseId"], name: "idx_userId_courseId"
  end

  create_table "course_task_try_view", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", null: false
    t.integer "courseSetId", null: false
    t.integer "courseId", null: false
    t.integer "taskId", null: false
    t.string "taskType", limit: 50, default: "", null: false, comment: "task.type"
    t.integer "createdTime", null: false
  end

  create_table "course_task_view", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "courseSetId", null: false
    t.integer "courseId", null: false
    t.integer "taskId", null: false
    t.integer "fileId", null: false
    t.integer "userId", null: false
    t.string "fileType", limit: 80, null: false
    t.string "fileStorage", limit: 80, null: false
    t.string "fileSource", limit: 32, null: false
    t.integer "createdTime", null: false, unsigned: true
  end

  create_table "course_thread", id: :integer, comment: "课程话题ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "courseId", default: 0, null: false, comment: "话题所属课程ID", unsigned: true
    t.integer "taskId", default: 0, null: false, comment: "任务ID", unsigned: true
    t.integer "userId", default: 0, null: false, comment: "话题发布人ID", unsigned: true
    t.string "type", limit: 10, default: "discussion", null: false, comment: "话题类型"
    t.integer "isStick", limit: 1, default: 0, null: false, comment: "是否置顶", unsigned: true
    t.integer "isElite", limit: 1, default: 0, null: false, comment: "是否精华", unsigned: true
    t.integer "isClosed", default: 0, null: false, comment: "是否关闭", unsigned: true
    t.boolean "private", default: false, null: false, comment: "是否隐藏", unsigned: true
    t.string "title", null: false, comment: "话题标题"
    t.text "content", comment: "话题内容"
    t.integer "postNum", default: 0, null: false, comment: "回复数", unsigned: true
    t.integer "hitNum", default: 0, null: false, comment: "查看数", unsigned: true
    t.integer "followNum", default: 0, null: false, comment: "关注数", unsigned: true
    t.integer "latestPostUserId", default: 0, null: false, comment: "最后回复人ID", unsigned: true
    t.integer "latestPostTime", default: 0, null: false, comment: "最后回复时间", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "话题创建时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.integer "courseSetId", null: false, unsigned: true
    t.index ["updatedTime"], name: "updatedTime"
  end

  create_table "course_thread_post", id: :integer, comment: "课程话题回复ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "courseId", default: 0, null: false, comment: "回复所属课程ID", unsigned: true
    t.integer "taskId", default: 0, null: false, comment: "任务ID", unsigned: true
    t.integer "threadId", default: 0, null: false, comment: "回复所属话题ID", unsigned: true
    t.integer "userId", default: 0, null: false, comment: "回复人", unsigned: true
    t.integer "isElite", limit: 1, default: 0, null: false, comment: "是否精华"
    t.text "content", null: false, comment: "正文"
    t.integer "createdTime", null: false, comment: "创建时间", unsigned: true
  end

  create_table "course_v8", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "courseSetId", null: false
    t.string "title", limit: 1024
    t.string "learnMode", limit: 32, comment: "lockMode, freeMode"
    t.string "expiryMode", limit: 32, comment: "days, date"
    t.integer "expiryDays"
    t.integer "expiryStartDate", unsigned: true
    t.integer "expiryEndDate", unsigned: true
    t.text "summary"
    t.text "goals"
    t.text "audiences"
    t.boolean "isDefault", default: false
    t.integer "maxStudentNum", default: 0
    t.string "status", limit: 32, comment: "draft, published, closed"
    t.integer "creator"
    t.boolean "isFree", default: false
    t.float "price", default: 0.0
    t.integer "vipLevelId", default: 0
    t.boolean "buyable", default: true
    t.boolean "tryLookable", default: false
    t.integer "tryLookLength", default: 0
    t.integer "watchLimit", default: 0
    t.text "services"
    t.integer "taskNum", default: 0, comment: "任务数"
    t.integer "compulsoryTaskNum", default: 0, comment: "必修任务数"
    t.integer "studentNum", default: 0, comment: "学员数"
    t.string "teacherIds", limit: 1024, default: "0", comment: "可见教师ID列表"
    t.integer "parentId", default: 0, null: false, comment: "课程的父Id", unsigned: true
    t.integer "createdTime", null: false, comment: "课程创建时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.integer "ratingNum", default: 0, null: false, comment: "课程计划评论数", unsigned: true
    t.float "rating", default: 0.0, null: false, comment: "课程计划评分", unsigned: true
    t.integer "noteNum", default: 0, null: false, unsigned: true
    t.integer "buyExpiryTime", default: 0, null: false, comment: "购买开放有效期", unsigned: true
    t.integer "threadNum", default: 0, comment: "话题数"
    t.string "type", limit: 32, default: "normal", null: false, comment: "教学计划类型"
    t.boolean "approval", default: false, null: false, comment: "是否需要实名才能购买", unsigned: true
    t.float "income", default: 0.0, null: false, comment: "总收入", unsigned: true
    t.float "originPrice", default: 0.0, null: false, comment: "课程人民币原价"
    t.float "coinPrice", default: 0.0, null: false
    t.float "originCoinPrice", default: 0.0, null: false, comment: "课程虚拟币原价"
    t.string "showStudentNumType", limit: 6, default: "opened", null: false, comment: "学员数显示模式"
    t.integer "giveCredit", default: 0, null: false, comment: "学完课程所有课时，可获得的总学分", unsigned: true
    t.text "about", comment: "简介"
    t.integer "locationId", default: 0, null: false, comment: "上课地区ID", unsigned: true
    t.string "address", default: "", null: false, comment: "上课地区地址"
    t.string "deadlineNotify", limit: 6, default: "none", null: false, comment: "开启有效期通知"
    t.integer "daysOfNotifyBeforeDeadline", default: 0, null: false
    t.string "useInClassroom", limit: 6, default: "single", null: false, comment: "课程能否用于多个班级"
    t.integer "singleBuy", default: 1, null: false, comment: "加入班级后课程能否单独购买", unsigned: true
    t.integer "freeStartTime", default: 0, null: false
    t.integer "freeEndTime", default: 0, null: false
    t.integer "locked", default: 0, null: false, comment: "是否上锁1上锁,0解锁"
    t.string "cover", limit: 1024
    t.integer "enableFinish", default: 1, null: false, comment: "是否允许学院强制完成任务"
    t.integer "materialNum", default: 0, null: false, comment: "上传的资料数量", unsigned: true
    t.integer "maxRate", limit: 1, default: 0, comment: "最大抵扣百分比"
    t.string "serializeMode", limit: 32, default: "none", null: false, comment: "none, serilized, finished"
    t.boolean "showServices", default: true, null: false, comment: "是否在营销页展示服务承诺"
    t.integer "recommended", limit: 1, default: 0, null: false, comment: "是否为推荐课程", unsigned: true
    t.integer "recommendedSeq", default: 0, null: false, comment: "推荐序号", unsigned: true
    t.integer "recommendedTime", default: 0, null: false, comment: "推荐时间", unsigned: true
    t.integer "categoryId", default: 0, null: false, comment: "分类", unsigned: true
    t.integer "hitNum", default: 0, null: false, comment: "点击量", unsigned: true
    t.string "courseType", limit: 32, default: "default", comment: "default, normal, times,..."
    t.integer "rewardPoint", default: 0, null: false, comment: "课程积分"
    t.integer "taskRewardPoint", default: 0, null: false, comment: "任务积分"
    t.integer "enableAudio", default: 0, null: false
    t.index ["courseSetId", "status"], name: "courseSetId_status"
    t.index ["courseSetId"], name: "courseSetId"
  end

  create_table "crontab_job", id: :integer, comment: "编号", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 1024, null: false, comment: "任务名称"
    t.string "cycle", limit: 10, default: "once", null: false, comment: "任务执行周期"
    t.string "cycleTime", default: "0", null: false, comment: "任务执行时间"
    t.string "jobClass", limit: 1024, null: false, comment: "任务的Class名称"
    t.text "jobParams", comment: "任务参数"
    t.string "targetType", limit: 64, default: "", null: false
    t.integer "targetId", default: 0, null: false, unsigned: true
    t.integer "executing", limit: 1, default: 0, null: false, comment: "任务执行状态", unsigned: true
    t.integer "nextExcutedTime", default: 0, null: false, comment: "任务下次执行的时间", unsigned: true
    t.integer "latestExecutedTime", default: 0, null: false, comment: "任务最后执行的时间", unsigned: true
    t.integer "creatorId", default: 0, null: false, comment: "任务创建人", unsigned: true
    t.integer "createdTime", null: false, comment: "任务创建时间", unsigned: true
    t.boolean "enabled", default: true, comment: "是否启用"
  end

  create_table "dictionary", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "字典名称"
    t.string "type", null: false, comment: "字典类型"
  end

  create_table "dictionary_item", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type", null: false, comment: "字典类型"
    t.string "code", limit: 64, comment: "编码"
    t.string "name", null: false, comment: "字典内容名称"
    t.integer "weight", default: 0, null: false, comment: "权重"
    t.integer "createdTime", null: false, unsigned: true
    t.integer "updateTime", default: 0, unsigned: true
  end

  create_table "discount", id: :integer, comment: "打折活动ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "打折活动", force: :cascade do |t|
    t.string "name", default: "", null: false, comment: "名称"
    t.string "type", limit: 8, default: "discount", null: false, comment: "类型(discount:限时打折, free:限时免费, global:全站打折)"
    t.integer "startTime", default: 0, null: false, comment: "开始时间", unsigned: true
    t.integer "endTime", default: 0, null: false, comment: "结束时间", unsigned: true
    t.integer "startJobId", default: 0, null: false, comment: "开始打折活动ID", unsigned: true
    t.integer "endJobId", default: 0, null: false, comment: "结束任务ID", unsigned: true
    t.string "itemType", limit: 64, default: "", null: false, comment: "活动对象类型"
    t.integer "itemCount", default: 0, null: false, comment: "活动对象数量", unsigned: true
    t.float "globalDiscount", default: 0.0, null: false, comment: "全站折扣", unsigned: true
    t.string "status", limit: 8, default: "unstart", null: false, comment: "活动状态"
    t.integer "changeTime", default: 0, null: false, comment: "状态变更时间", unsigned: true
    t.string "auditStatus", limit: 8, default: "creation", null: false, comment: "审核状态"
    t.integer "auditorId", default: 0, null: false, comment: "审核人", unsigned: true
    t.integer "auditedTime", default: 0, null: false, comment: "审核时间", unsigned: true
    t.integer "creatorId", default: 0, null: false, comment: "创建人", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
  end

  create_table "discount_item", id: :integer, comment: "编号", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "打折活动对象条目", force: :cascade do |t|
    t.integer "discountId", default: 0, null: false, comment: "活动ID", unsigned: true
    t.string "targetType", limit: 64, default: "", null: false, comment: "对象类型"
    t.integer "targetId", default: 0, null: false, comment: "对象ID", unsigned: true
    t.float "discount", default: 10.0, null: false, comment: "折扣", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
  end

  create_table "discovery_column", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "发现页栏目", force: :cascade do |t|
    t.string "title", null: false
    t.string "type", limit: 32, null: false, comment: "栏目类型"
    t.integer "categoryId", default: 0, null: false, comment: "分类"
    t.string "orderType", limit: 32, null: false, comment: "排序字段"
    t.integer "showCount", null: false, comment: "展示数量"
    t.integer "seq", default: 0, null: false, comment: "排序", unsigned: true
    t.integer "createdTime", null: false, unsigned: true
    t.integer "updateTime", default: 0, null: false, unsigned: true
  end

  create_table "distributor_job_data", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "data", null: false, comment: "数据"
    t.string "jobType", limit: 128, null: false, comment: "使用的同步类型, 如order为 biz[distributor.sync.order] = BizDistributorServiceImplSyncOrderServiceImpl"
    t.string "status", limit: 32, default: "pending", null: false, comment: "分为 pending -- 可以发, finished -- 已发送, error -- 错误， 只有 pending 和 error 才会尝试发送"
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.integer "updatedTime", default: 0, null: false, unsigned: true
  end

  create_table "download_file_record", id: :integer, comment: "ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "downloadActivityId", default: 0, null: false, comment: "资料所属活动ID", unsigned: true
    t.integer "materialId", default: 0, null: false, comment: "资料文件ID", unsigned: true
    t.string "fileId", limit: 1024, default: "", comment: "文件ID"
    t.string "link", limit: 1024, default: "", comment: "链接地址"
    t.integer "createdTime", null: false, comment: "下载时间", unsigned: true
    t.integer "userId", null: false, comment: "下载用户ID", unsigned: true
    t.index ["createdTime"], name: "createdTime"
  end

  create_table "file", id: :integer, comment: "上传文件ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "groupId", default: 0, null: false, comment: "上传文件组ID", unsigned: true
    t.integer "userId", default: 0, null: false, comment: "上传人ID", unsigned: true
    t.string "uri", null: false, comment: "文件URI"
    t.string "mime", null: false, comment: "文件MIME"
    t.integer "size", default: 0, null: false, comment: "文件大小", unsigned: true
    t.integer "status", limit: 1, default: 0, null: false, comment: "文件状态", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "文件上传时间", unsigned: true
    t.integer "uploadFileId"
  end

  create_table "file_group", id: :integer, comment: "上传文件组ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false, comment: "上传文件组名称"
    t.string "code", null: false, comment: "上传文件组编码"
    t.integer "public", limit: 1, default: 1, null: false, comment: "文件组文件是否公开"
  end

  create_table "file_used", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type", limit: 32, null: false
    t.integer "fileId", null: false, comment: "upload_files id"
    t.string "targetType", limit: 32, null: false
    t.integer "targetId", null: false
    t.integer "createdTime", null: false
    t.index ["fileId"], name: "file_used_fileId_index"
    t.index ["type", "targetType", "targetId", "fileId"], name: "file_used_type_targetType_targetId_fileId_index"
    t.index ["type", "targetType", "targetId"], name: "file_used_type_targetType_targetId_index"
  end

  create_table "friend", id: :integer, comment: "关注ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "fromId", null: false, comment: "关注人ID", unsigned: true
    t.integer "toId", null: false, comment: "被关注人ID", unsigned: true
    t.integer "pair", limit: 1, default: 0, null: false, comment: "是否为互加好友", unsigned: true
    t.integer "createdTime", null: false, comment: "关注时间", unsigned: true
  end

  create_table "groups", id: :integer, comment: "小组id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 100, null: false, comment: "小组名称"
    t.text "about", comment: "小组介绍"
    t.string "logo", limit: 100, default: "", null: false, comment: "logo"
    t.string "backgroundLogo", limit: 100, default: "", null: false
    t.string "status", limit: 5, default: "open", null: false
    t.integer "memberNum", default: 0, null: false, unsigned: true
    t.integer "threadNum", default: 0, null: false, unsigned: true
    t.integer "postNum", default: 0, null: false, unsigned: true
    t.integer "ownerId", null: false, comment: "小组组长id", unsigned: true
    t.integer "createdTime", null: false, comment: "创建小组时间", unsigned: true
  end

  create_table "groups_member", id: :integer, comment: "成员id主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "groupId", null: false, comment: "小组id", unsigned: true
    t.integer "userId", null: false, comment: "用户id", unsigned: true
    t.string "role", limit: 100, default: "member", null: false
    t.integer "postNum", default: 0, null: false, unsigned: true
    t.integer "threadNum", default: 0, null: false, unsigned: true
    t.integer "createdTime", null: false, comment: "加入时间", unsigned: true
  end

  create_table "groups_thread", id: :integer, comment: "话题id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 1024, null: false, comment: "话题标题"
    t.text "content", comment: "话题内容"
    t.integer "isElite", default: 0, null: false, unsigned: true
    t.integer "isStick", default: 0, null: false, unsigned: true
    t.integer "lastPostMemberId", default: 0, null: false, unsigned: true
    t.integer "lastPostTime", default: 0, null: false, unsigned: true
    t.integer "groupId", null: false, unsigned: true
    t.integer "userId", null: false, unsigned: true
    t.integer "createdTime", null: false, comment: "添加时间", unsigned: true
    t.integer "postNum", default: 0, null: false, unsigned: true
    t.string "status", limit: 5, default: "open", null: false
    t.integer "hitNum", default: 0, null: false, unsigned: true
    t.integer "rewardCoin", default: 0, null: false, unsigned: true
    t.string "type", default: "default", null: false
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.index ["updatedTime"], name: "updatedTime"
  end

  create_table "groups_thread_collect", id: :integer, comment: "id主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "threadId", null: false, comment: "收藏的话题id", unsigned: true
    t.integer "userId", null: false, comment: "收藏人id", unsigned: true
    t.integer "createdTime", null: false, comment: "收藏时间", unsigned: true
  end

  create_table "groups_thread_goods", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "title", null: false
    t.text "description"
    t.integer "userId", default: 0, null: false, unsigned: true
    t.string "type", limit: 14, null: false
    t.integer "threadId", null: false, unsigned: true
    t.integer "postId", default: 0, null: false, unsigned: true
    t.integer "coin", null: false, unsigned: true
    t.integer "fileId", default: 0, null: false, unsigned: true
    t.integer "hitNum", default: 0, null: false, unsigned: true
    t.integer "createdTime", default: 0, null: false, unsigned: true
  end

  create_table "groups_thread_post", id: :integer, comment: "id主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "threadId", null: false, comment: "话题id", unsigned: true
    t.text "content", null: false, comment: "回复内容"
    t.integer "userId", null: false, comment: "回复人id", unsigned: true
    t.integer "fromUserId", default: 0, null: false, unsigned: true
    t.integer "postId", default: 0, unsigned: true
    t.integer "createdTime", null: false, comment: "回复时间", unsigned: true
    t.integer "adopt", default: 0, null: false, unsigned: true
  end

  create_table "groups_thread_trade", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "threadId", default: 0, unsigned: true
    t.integer "goodsId", default: 0
    t.integer "userId", null: false, unsigned: true
    t.integer "createdTime", default: 0, null: false, unsigned: true
  end

  create_table "im_conversation", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "IM云端会话记录表", force: :cascade do |t|
    t.string "no", limit: 64, null: false, comment: "IM云端返回的会话id"
    t.string "targetType", limit: 16, default: "", null: false
    t.integer "targetId", default: 0, null: false, unsigned: true
    t.text "memberIds", null: false, comment: "会话中用户列表(用户id按照小到大排序，竖线隔开)"
    t.string "memberHash", limit: 32, default: "", null: false, comment: "memberIds字段的hash值，用于优化查询"
    t.integer "createdTime", null: false, unsigned: true
    t.string "title", default: "", null: false
    t.index ["no"], name: "no", unique: true
    t.index ["targetId"], name: "targetId"
    t.index ["targetType"], name: "targetType"
  end

  create_table "im_member", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "会话用户表", force: :cascade do |t|
    t.string "convNo", limit: 32, null: false, comment: "会话ID"
    t.integer "targetId", null: false
    t.string "targetType", limit: 15, null: false
    t.integer "userId", default: 0, null: false
    t.integer "createdTime", default: 0
    t.index ["convNo", "userId"], name: "convno_userId"
    t.index ["userId", "targetType"], name: "userId_targetType"
  end

  create_table "invite_record", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "邀请记录表", force: :cascade do |t|
    t.integer "inviteUserId", comment: "邀请者", unsigned: true
    t.integer "invitedUserId", comment: "被邀请者", unsigned: true
    t.integer "inviteTime", comment: "邀请时间", unsigned: true
    t.integer "inviteUserCardId", comment: "邀请者获得奖励的卡的ID", unsigned: true
    t.integer "invitedUserCardId", comment: "被邀请者获得奖励的卡的ID", unsigned: true
    t.float "amount", default: 0.0, null: false, comment: "被邀请者被邀请后的消费总额"
    t.float "cashAmount", default: 0.0, null: false, comment: "被邀请者被邀请后的现金消费总额"
    t.float "coinAmount", default: 0.0, null: false, comment: "被邀请者被邀请后的虚拟币消费总额"
    t.index ["inviteUserId"], name: "idx_inviteUserId"
  end

  create_table "ip_blacklist", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ip", limit: 32, null: false
    t.string "type", limit: 6, default: "failed", null: false, comment: "禁用类型"
    t.integer "counter", default: 0, null: false, unsigned: true
    t.integer "expiredTime", default: 0, null: false, unsigned: true
    t.integer "createdTime", default: 0, null: false, unsigned: true
  end

  create_table "keyword", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.string "state", limit: 8, default: "replaced", null: false
    t.integer "bannedNum", default: 0, null: false, unsigned: true
    t.integer "createdTime", null: false, unsigned: true
    t.index ["name"], name: "name", unique: true
  end

  create_table "keyword_banlog", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "keywordId", null: false, unsigned: true
    t.string "keywordName", limit: 64, default: "", null: false
    t.string "state", limit: 8, default: "replaced", null: false
    t.text "text", null: false
    t.integer "userId", default: 0, null: false, unsigned: true
    t.string "ip", limit: 64, default: "", null: false
    t.integer "createdTime", null: false, unsigned: true
    t.index ["keywordId"], name: "keywordId"
  end

  create_table "location", id: :bigint, unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "parentId", default: 0, null: false
    t.string "name", null: false
    t.string "pinyin", null: false
  end

  create_table "log", id: :integer, comment: "系统日志ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", default: 0, null: false, comment: "操作人ID", unsigned: true
    t.string "module", limit: 32, null: false, comment: "日志所属模块"
    t.string "action", limit: 32, null: false, comment: "日志所属操作类型"
    t.text "message", null: false, comment: "日志内容"
    t.text "data", comment: "日志数据"
    t.string "ip", null: false, comment: "日志记录IP"
    t.integer "createdTime", null: false, comment: "日志发生时间", unsigned: true
    t.string "level", limit: 10, null: false, comment: "日志等级"
    t.index ["userId"], name: "userId"
  end

  create_table "marker", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "驻点", force: :cascade do |t|
    t.integer "second", null: false, comment: "驻点时间", unsigned: true
    t.integer "mediaId", default: 0, null: false, comment: "媒体文件ID", unsigned: true
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.integer "updatedTime", default: 0, null: false, unsigned: true
  end

  create_table "member_operation_record", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 1024, default: "", null: false, comment: "标题"
    t.integer "member_id", null: false, comment: "成员ID", unsigned: true
    t.string "member_type", limit: 32, default: "student", null: false, comment: "成员身份"
    t.integer "target_id", default: 0, null: false, comment: "类型ID", unsigned: true
    t.integer "parent_id", default: 0, null: false, comment: "班级课程的被复制的计划Id"
    t.integer "course_set_id", default: 0, null: false, comment: "课程Id"
    t.string "target_type", limit: 32, default: "", null: false, comment: "类型（classroom, course）"
    t.string "operate_type", limit: 32, default: "", null: false, comment: "操作类型（join, exit）"
    t.boolean "exit_course_set", default: false, null: false, comment: "退出的课程的最后教学计划，算退出课程"
    t.boolean "join_course_set", default: false, null: false, comment: "加入的课程的第一个教学计划，算加入课程"
    t.integer "operate_time", default: 0, null: false, comment: "操作时间", unsigned: true
    t.integer "operator_id", default: 0, null: false, comment: "操作用户ID", unsigned: true
    t.text "data", comment: "extra data"
    t.integer "user_id", default: 0, null: false, comment: "用户Id"
    t.integer "order_id", default: 0, null: false, comment: "订单ID"
    t.integer "refund_id", default: 0, null: false, comment: "退款ID"
    t.string "reason", limit: 256, default: "", null: false, comment: "加入理由或退出理由"
    t.string "reason_type", default: "", null: false, comment: "用户退出或加入的类型：refund, remove, exit"
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.index ["operate_type"], name: "operate_type"
    t.index ["order_id"], name: "order_id"
  end

  create_table "message", id: :integer, comment: "私信Id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type", limit: 5, default: "text", null: false, comment: "私信类型"
    t.integer "fromId", default: 0, null: false, comment: "发信人Id", unsigned: true
    t.integer "toId", default: 0, null: false, comment: "收信人Id", unsigned: true
    t.text "content", null: false, comment: "私信内容"
    t.integer "createdTime", default: 0, null: false, comment: "私信发送时间", unsigned: true
    t.integer "isDelete", default: 0, null: false, comment: "是否已删除"
  end

  create_table "message_conversation", id: :integer, comment: "会话Id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "fromId", default: 0, null: false, comment: "发信人Id", unsigned: true
    t.integer "toId", default: 0, null: false, comment: "收信人Id", unsigned: true
    t.integer "messageNum", default: 0, null: false, comment: "此对话的信息条数", unsigned: true
    t.integer "latestMessageUserId", comment: "最后发信人ID", unsigned: true
    t.integer "latestMessageTime", null: false, comment: "最后发信时间", unsigned: true
    t.text "latestMessageContent", null: false, comment: "最后发信内容"
    t.string "latestMessageType", limit: 5, default: "text", null: false, comment: "最后一条私信类型"
    t.integer "unreadNum", null: false, comment: "未读数量", unsigned: true
    t.integer "createdTime", null: false, comment: "会话创建时间", unsigned: true
    t.index ["toId", "fromId"], name: "toId_fromId"
    t.index ["toId", "latestMessageTime"], name: "toId_latestMessageTime"
  end

  create_table "message_relation", id: :integer, comment: "消息关联ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "conversationId", default: 0, null: false, comment: "关联的会话ID", unsigned: true
    t.integer "messageId", default: 0, null: false, comment: "关联的消息ID", unsigned: true
    t.string "isRead", limit: 1, default: "0", null: false, comment: "是否已读"
  end

  create_table "migration_versions", primary_key: "version", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
  end

  create_table "mobile_device", id: :integer, comment: "设备ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "imei", null: false, comment: "串号"
    t.string "platform", null: false, comment: "平台"
    t.string "version", null: false, comment: "版本"
    t.string "screenresolution", limit: 100, null: false, comment: "分辨率"
    t.string "kernel", null: false, comment: "内核"
  end

  create_table "money_card", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cardId", limit: 32, null: false
    t.string "password", limit: 32, null: false
    t.string "deadline", limit: 19, null: false, comment: "有效时间"
    t.integer "rechargeTime", default: 0, null: false, comment: "充值时间，0为未充值"
    t.string "cardStatus", limit: 9, default: "invalid", null: false
    t.integer "receiveTime", default: 0, null: false, comment: "领取学习卡时间"
    t.integer "rechargeUserId", default: 0, null: false
    t.integer "batchId", default: 0, null: false
  end

  create_table "money_card_batch", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cardPrefix", limit: 32, null: false
    t.integer "cardLength", default: 0, null: false
    t.integer "number", default: 0, null: false
    t.integer "receivedNumber", default: 0, null: false
    t.integer "rechargedNumber", default: 0, null: false
    t.string "token", limit: 64, default: "0", null: false
    t.string "deadline", limit: 19, null: false, collation: "latin1_swedish_ci"
    t.integer "money", default: 0, null: false
    t.integer "coin", default: 0, null: false
    t.integer "userId", default: 0, null: false
    t.integer "createdTime", default: 0, null: false
    t.string "note", limit: 128, null: false
    t.string "batchName", limit: 15, default: "", null: false
    t.string "batchStatus", limit: 7, default: "normal", null: false
  end

  create_table "navigation", id: :integer, comment: "导航ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "导航数据表", force: :cascade do |t|
    t.string "name", null: false, comment: "导航名称"
    t.string "url", limit: 300, null: false, comment: "链接地址"
    t.integer "sequence", limit: 1, null: false, comment: "显示顺序", unsigned: true
    t.integer "parentId", default: 0, null: false, comment: "父导航ID", unsigned: true
    t.integer "createdTime", null: false, comment: "创建时间"
    t.integer "updateTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.string "type", limit: 30, null: false, comment: "类型"
    t.integer "isOpen", limit: 1, default: 1, null: false, comment: "默认1，为开启"
    t.integer "isNewWin", limit: 1, default: 1, null: false, comment: "默认为1,另开窗口"
    t.integer "orgId", default: 1, unsigned: true
    t.string "orgCode", default: "1.", comment: "组织机构内部编码"
  end

  create_table "notification", id: :integer, comment: "通知ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", null: false, comment: "被通知的用户ID", unsigned: true
    t.string "type", limit: 64, default: "default", null: false, comment: "通知类型"
    t.text "content", comment: "通知内容"
    t.integer "batchId", default: 0, null: false, comment: "群发通知表中的ID"
    t.integer "createdTime", null: false, comment: "通知时间", unsigned: true
    t.boolean "isRead", default: false, null: false, comment: "是否已读"
  end

  create_table "open_course", id: :integer, comment: "课程ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 1024, null: false, comment: "课程标题"
    t.string "subtitle", limit: 1024, default: "", null: false, comment: "课程副标题"
    t.string "status", limit: 9, default: "draft", null: false, comment: "课程状态"
    t.string "type", default: "normal", null: false, comment: "课程类型"
    t.integer "lessonNum", default: 0, null: false, comment: "课时数", unsigned: true
    t.integer "categoryId", default: 0, null: false, comment: "分类ID", unsigned: true
    t.text "tags", comment: "标签IDs"
    t.string "smallPicture", default: "", null: false, comment: "小图"
    t.string "middlePicture", default: "", null: false, comment: "中图"
    t.string "largePicture", default: "", null: false, comment: "大图"
    t.text "about", comment: "简介"
    t.text "teacherIds", comment: "显示的课程教师IDs"
    t.integer "studentNum", default: 0, null: false, comment: "学员数", unsigned: true
    t.integer "hitNum", default: 0, null: false, comment: "查看次数", unsigned: true
    t.integer "likeNum", default: 0, null: false, comment: "点赞数"
    t.integer "postNum", default: 0, null: false, comment: "评论数"
    t.integer "userId", null: false, comment: "课程发布人ID", unsigned: true
    t.integer "parentId", default: 0, null: false, comment: "课程的父Id", unsigned: true
    t.integer "locked", default: 0, null: false, comment: "是否上锁1上锁,0解锁"
    t.integer "recommended", limit: 1, default: 0, null: false, comment: "是否为推荐课程", unsigned: true
    t.integer "recommendedSeq", default: 0, null: false, comment: "推荐序号", unsigned: true
    t.integer "recommendedTime", default: 0, null: false, comment: "推荐时间", unsigned: true
    t.integer "createdTime", null: false, comment: "课程创建时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.integer "orgId", default: 1, null: false, comment: "组织机构ID", unsigned: true
    t.string "orgCode", default: "1.", null: false, comment: "组织机构内部编码"
    t.index ["updatedTime"], name: "updatedTime"
  end

  create_table "open_course_lesson", id: :integer, comment: "课时ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "courseId", null: false, comment: "课时所属课程ID", unsigned: true
    t.integer "chapterId", default: 0, null: false, comment: "课时所属章节ID", unsigned: true
    t.integer "number", null: false, comment: "课时编号", unsigned: true
    t.integer "seq", default: 0, null: false, comment: "课时在课程中的序号", unsigned: true
    t.integer "free", limit: 1, default: 0, null: false, comment: "是否为免费课时", unsigned: true
    t.string "status", limit: 11, default: "published", null: false, comment: "课时状态"
    t.string "title", null: false, comment: "课时标题"
    t.text "summary", comment: "课时摘要"
    t.text "tags", comment: "课时标签"
    t.string "type", limit: 64, default: "text", null: false, comment: "课时类型"
    t.text "content", comment: "课时正文"
    t.integer "giveCredit", default: 0, null: false, comment: "学完课时获得的学分", unsigned: true
    t.integer "requireCredit", default: 0, null: false, comment: "学习课时前，需达到的学分", unsigned: true
    t.integer "mediaId", default: 0, null: false, comment: "媒体文件ID", unsigned: true
    t.string "mediaSource", limit: 32, default: "", null: false, comment: "媒体文件来源(self:本站上传,youku:优酷)"
    t.string "mediaName", default: "", null: false, comment: "媒体文件名称"
    t.text "mediaUri", comment: "媒体文件资源名"
    t.integer "homeworkId", default: 0, null: false, comment: "作业iD", unsigned: true
    t.integer "exerciseId", default: 0, comment: "练习ID", unsigned: true
    t.integer "length", comment: "时长", unsigned: true
    t.integer "materialNum", default: 0, null: false, comment: "上传的资料数量", unsigned: true
    t.integer "quizNum", default: 0, null: false, comment: "测验题目数量", unsigned: true
    t.integer "learnedNum", default: 0, null: false, comment: "已学的学员数", unsigned: true
    t.integer "viewedNum", default: 0, null: false, comment: "查看数", unsigned: true
    t.integer "startTime", default: 0, null: false, comment: "直播课时开始时间", unsigned: true
    t.integer "endTime", default: 0, null: false, comment: "直播课时结束时间", unsigned: true
    t.integer "memberNum", default: 0, null: false, comment: "直播课时加入人数", unsigned: true
    t.string "replayStatus", limit: 14, default: "ungenerated", null: false
    t.integer "maxOnlineNum", default: 0, comment: "直播在线人数峰值"
    t.integer "liveProvider", default: 0, null: false, unsigned: true
    t.integer "userId", null: false, comment: "发布人ID", unsigned: true
    t.integer "createdTime", null: false, comment: "创建时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.integer "copyId", default: 0, null: false, comment: "复制课时id"
    t.string "testMode", limit: 8, default: "normal", comment: "考试模式"
    t.integer "testStartTime", default: 0, comment: "实时考试开始时间"
    t.index ["updatedTime"], name: "updatedTime"
  end

  create_table "open_course_member", id: :integer, comment: "课程学员记录ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "courseId", null: false, comment: "课程ID", unsigned: true
    t.integer "userId", default: 0, null: false, comment: "学员ID", unsigned: true
    t.string "mobile", limit: 32, default: "", null: false, comment: "手机号码"
    t.integer "learnedNum", default: 0, null: false, comment: "已学课时数", unsigned: true
    t.integer "learnTime", default: 0, null: false, comment: "学习时间", unsigned: true
    t.integer "seq", default: 0, null: false, comment: "排序序号", unsigned: true
    t.integer "isVisible", limit: 1, default: 1, null: false, comment: "可见与否，默认为可见"
    t.string "role", limit: 7, default: "student", null: false, comment: "课程会员角色"
    t.string "ip", limit: 64, comment: "IP地址"
    t.integer "lastEnterTime", default: 0, null: false, comment: "上次进入时间", unsigned: true
    t.integer "isNotified", default: 0, null: false, comment: "直播开始通知"
    t.integer "createdTime", null: false, comment: "学员加入课程时间", unsigned: true
    t.index ["ip", "courseId"], name: "open_course_member_ip_courseId_index"
  end

  create_table "open_course_recommend", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "公开课推荐课程表", force: :cascade do |t|
    t.integer "openCourseId", null: false, comment: "公开课id"
    t.integer "recommendCourseId", default: 0, null: false, comment: "推荐课程id"
    t.integer "seq", default: 0, null: false, comment: "序列"
    t.string "type", null: false, comment: "类型"
    t.integer "createdTime", null: false, comment: "创建时间"
    t.index ["openCourseId"], name: "open_course_recommend_openCourseId_index"
  end

  create_table "order_log", id: :integer, comment: "订单日志ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "orderId", null: false, comment: "订单ID", unsigned: true
    t.string "type", limit: 32, null: false, comment: "订单日志类型"
    t.text "message", comment: "订单日志内容"
    t.text "data", comment: "订单日志数据"
    t.integer "userId", null: false, comment: "订单操作人", unsigned: true
    t.string "ip", null: false, comment: "订单操作IP"
    t.integer "createdTime", null: false, comment: "订单日志记录时间", unsigned: true
    t.index ["orderId"], name: "orderId"
  end

  create_table "order_referer", id: :integer, comment: "ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "用户访问日志Token", force: :cascade do |t|
    t.string "uv", limit: 64, null: false
    t.text "data", null: false
    t.text "orderIds"
    t.integer "expiredTime", default: 0, null: false, comment: "过期时间", unsigned: true
    t.index ["uv", "expiredTime"], name: "order_referer_uv_expiredTime_index"
  end

  create_table "order_referer_log", id: :integer, comment: "ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "订单促成日志", force: :cascade do |t|
    t.integer "refererLogId", null: false, comment: "促成订单的访问日志ID"
    t.integer "orderId", default: 0, comment: "订单ID", unsigned: true
    t.integer "sourceTargetId", default: 0, null: false, comment: "来源ID", unsigned: true
    t.string "sourceTargetType", limit: 64, default: "", null: false, comment: "来源类型"
    t.string "targetType", limit: 64, default: "", null: false, comment: "订单的对象类型"
    t.integer "targetId", default: 0, null: false, comment: "订单的对象ID", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "订单支付时间", unsigned: true
    t.integer "createdUserId", default: 0, null: false, comment: "订单支付者", unsigned: true
  end

  create_table "order_refund", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "id", null: false, comment: "订单退款记录ID", unsigned: true, auto_increment: true
    t.integer "orderId", null: false, comment: "退款订单ID", unsigned: true
    t.integer "userId", null: false, comment: "退款人ID", unsigned: true
    t.string "targetType", limit: 64, default: "", null: false, comment: "订单退款记录所属对象类型"
    t.integer "targetId", null: false, comment: "订单退款记录所属对象ID", unsigned: true
    t.string "status", limit: 9, default: "created", null: false, comment: "退款状态"
    t.float "expectedAmount", default: 0.0, comment: "期望退款的金额，NULL代表未知，0代表不需要退款", unsigned: true
    t.float "actualAmount", default: 0.0, null: false, comment: "实际退款金额，0代表无退款", unsigned: true
    t.string "reasonType", limit: 64, default: "", null: false, comment: "退款理由类型"
    t.string "reasonNote", limit: 1024, default: "", null: false, comment: "退款理由"
    t.integer "updatedTime", default: 0, null: false, comment: "订单退款记录最后更新时间", unsigned: true
    t.integer "createdTime", null: false, comment: "订单退款记录创建时间", unsigned: true
    t.integer "operator", null: false, comment: "操作人", unsigned: true
    t.index ["id"], name: "id", unique: true
  end

  create_table "orders", id: :integer, comment: "订单ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sn", limit: 32, null: false, comment: "订单编号"
    t.string "status", limit: 9, null: false, comment: "订单状态"
    t.string "title", null: false, comment: "订单标题"
    t.string "targetType", limit: 64, default: "", null: false, comment: "订单所属对象类型"
    t.integer "targetId", default: 0, null: false, comment: "订单所属对象ID", unsigned: true
    t.float "amount", default: 0.0, null: false, comment: "订单实付金额", unsigned: true
    t.float "totalPrice", default: 0.0, null: false, comment: "订单总价"
    t.integer "isGift", limit: 1, default: 0, null: false, comment: "是否为赠送礼物", unsigned: true
    t.string "giftTo", limit: 64, default: "", null: false, comment: "赠送给用户ID"
    t.integer "discountId", default: 0, null: false, comment: "折扣活动ID", unsigned: true
    t.float "discount", default: 10.0, null: false, comment: "折扣"
    t.integer "refundId", default: 0, null: false, comment: "最后一次退款操作记录的ID", unsigned: true
    t.integer "userId", null: false, comment: "订单创建人", unsigned: true
    t.string "coupon", default: "", null: false, comment: "优惠码"
    t.float "couponDiscount", default: 0.0, null: false, comment: "优惠码扣减金额", unsigned: true
    t.string "payment", limit: 32, default: "none", null: false, comment: "订单支付方式"
    t.float "coinAmount", default: 0.0, null: false, comment: "虚拟币支付额"
    t.float "coinRate", default: 1.0, null: false, comment: "虚拟币汇率"
    t.string "priceType", limit: 4, default: "RMB", null: false, comment: "创建订单时的标价类型"
    t.string "bank", limit: 32, default: "", null: false, comment: "银行编号"
    t.integer "paidTime", default: 0, null: false, comment: "支付时间", unsigned: true
    t.bigint "cashSn", comment: "支付流水号"
    t.string "note", default: "", null: false, comment: "备注"
    t.text "data", comment: "订单业务数据"
    t.integer "refundEndTime", default: 0, null: false, comment: "退款截止时间"
    t.integer "createdTime", null: false, comment: "订单创建时间", unsigned: true
    t.integer "updatedTime", null: false
    t.string "token", limit: 50, comment: "令牌"
    t.index ["sn"], name: "sn", unique: true
    t.index ["userId"], name: "idx_userId"
  end

  create_table "org", id: :integer, comment: "组织机构ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "组织机构", force: :cascade do |t|
    t.string "name", null: false, comment: "名称"
    t.integer "parentId", default: 0, null: false, comment: "组织机构父ID"
    t.integer "childrenNum", limit: 1, default: 0, null: false, comment: "辖下组织机构数量", unsigned: true
    t.integer "depth", default: 1, null: false, comment: "当前组织机构层级"
    t.integer "seq", default: 0, null: false, comment: "索引"
    t.text "description", comment: "备注"
    t.string "code", default: "", null: false, comment: "机构编码"
    t.string "orgCode", default: "0", null: false, comment: "内部编码"
    t.integer "createdUserId", null: false, comment: "创建用户ID"
    t.integer "createdTime", null: false, comment: "创建时间", unsigned: true
    t.integer "updateTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.index ["code"], name: "code", unique: true
    t.index ["orgCode"], name: "orgCode", unique: true
  end

  create_table "plugin_crm_event_fail_over", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "event_type", limit: 32, default: "", null: false, comment: "事件类型"
    t.text "parameter", comment: "参数"
    t.integer "times", default: 0, null: false, comment: "处理次数", unsigned: true
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.string "source", default: "", null: false, comment: "来源"
  end

  create_table "plugin_crm_marketing_log", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "sn", limit: 64, default: "0", comment: "流水sn"
    t.text "user_ids", comment: "发送用户"
    t.text "data", comment: "参数"
    t.boolean "status", default: false, null: false, comment: "发送状态"
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "created_time", default: 0, null: false, unsigned: true
  end

  create_table "plugin_crm_marketing_record", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "sn", limit: 64, default: "0", null: false, comment: "流水号"
    t.integer "create_user", null: false, comment: "创建者id", unsigned: true
    t.string "target_user", limit: 32, default: "", null: false, comment: "接收者(batch, userId)"
    t.string "send_type", limit: 32, default: "", null: false, comment: "营销类型(email,qq)"
    t.string "follow_type", limit: 32, default: "", comment: "手动跟进类型"
    t.integer "send_num", default: 0, null: false, comment: "发送数量", unsigned: true
    t.integer "send_people_num", default: 0, null: false, comment: "发送人数", unsigned: true
    t.integer "success_num", default: 0, null: false, comment: "发送成功人数"
    t.integer "failed_num", default: 0, null: false, comment: "发送失败人数"
    t.integer "sending_num", default: 0, null: false, comment: "等待发送数量"
    t.integer "templateId", default: 0, null: false, comment: "模版id", unsigned: true
    t.text "parameter", comment: "模版参数"
    t.text "content", comment: "营销内容"
    t.integer "pv", default: 0, null: false, comment: "pv量", unsigned: true
    t.string "send_status", limit: 32, default: "", null: false, comment: "发送状态(sending,end)"
    t.text "remark", comment: "备注"
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "created_time", default: 0, null: false, unsigned: true
  end

  create_table "plugin_crm_message_template", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", default: "", null: false, comment: "模板名"
    t.text "content"
    t.string "status", limit: 32, default: "fail", null: false, comment: "审核状态,fail:审核未通过,checking:审核中,success:可使用"
    t.text "audit_message", comment: "审核信息"
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.integer "updated_time", default: 0, null: false, unsigned: true
  end

  create_table "plugin_crm_product", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "source_id", null: false, comment: "产品id", unsigned: true
    t.string "type", limit: 32, default: "course", null: false, comment: "产品类型"
    t.string "title", limit: 1024, comment: "标题"
    t.integer "price", default: 0, null: false, comment: "价格，单位分"
    t.integer "min_price", default: 0, null: false, comment: "最小价格，单位分"
    t.integer "max_price", default: 0, null: false, comment: "最大价格，单位分"
    t.integer "parent_id", default: 0, null: false, comment: "父产品id"
    t.integer "income", default: 0, null: false, comment: "收入，单位分"
    t.integer "category_id", default: 0, null: false, comment: "分类id", unsigned: true
    t.integer "potential_member_num", default: 0, null: false, comment: "潜在学员数量", unsigned: true
    t.integer "unpaid_member_num", default: 0, null: false, comment: "未支付学员数量", unsigned: true
    t.integer "refunding_member_num", default: 0, null: false, comment: "申请退款学员数量", unsigned: true
    t.integer "refunded_member_num", default: 0, null: false, comment: "退款成功学员数量", unsigned: true
    t.integer "formal_member_num", default: 0, null: false, comment: "正式学员数量", unsigned: true
    t.integer "exit_member_num", default: 0, null: false, comment: "退出学员包括，自己退出，退款和老师移除"
    t.integer "lesson_num", default: 0, null: false, comment: "课时数", unsigned: true
    t.integer "updated_time", default: 0, null: false, comment: "es产品的updated_time", unsigned: true
    t.integer "created_time", default: 0, null: false, comment: "es产品的created_time", unsigned: true
    t.integer "sync_time", default: 0, null: false, unsigned: true
    t.index ["source_id", "type"], name: "source_id", unique: true
  end

  create_table "plugin_crm_product_member", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "source_member_id", default: 0, null: false, comment: "es 原memberId"
    t.integer "user_id", null: false, comment: "用户id", unsigned: true
    t.integer "product_id", null: false, comment: "产品id", unsigned: true
    t.string "product_type", limit: 64, default: "0", null: false, comment: "产品类型"
    t.integer "parent_product_id", default: 0, null: false, comment: "父产品id"
    t.boolean "is_favorite", default: false, null: false, comment: "是否收藏:0:否, 1:是"
    t.boolean "is_auditor", default: false, null: false, comment: "是否旁听生:0:否, 1:是"
    t.boolean "try_watched", default: false, null: false, comment: "是否试看过:0:否, 1:是"
    t.boolean "free_watched", default: false, null: false, comment: "是否观看免费课时:0:否, 1:是"
    t.string "status", limit: 32, default: "", null: false, comment: "用户状态"
    t.string "intent", limit: 32, default: "unset", null: false, comment: "用户意向程度"
    t.integer "amount", default: 0, null: false, comment: "实付金额,单位为分", unsigned: true
    t.text "remark", comment: "备注"
    t.integer "become_member_time", default: 0, null: false, comment: "成为正式学员时间", unsigned: true
    t.string "order_status", default: "create", null: false, comment: "订单状态"
    t.integer "learned_num", default: 0, null: false, comment: "学习课时数", unsigned: true
    t.integer "refund_time", default: 0, null: false, comment: "申请退款时间", unsigned: true
    t.integer "refund_audit_time", default: 0, null: false, comment: "退款审核时间", unsigned: true
    t.string "refund_audit_message", limit: 1024, default: "", null: false, comment: "退款审核消息"
    t.string "refund_audit_status", default: "", null: false, comment: "退款审核状态"
    t.string "exit_reason", limit: 1024, default: "", null: false, comment: "退出理由，申请退款理由"
    t.integer "deadline", default: 0, null: false, comment: "到期时间", unsigned: true
    t.integer "last_learn_time", default: 0, null: false, comment: "上次学习时间", unsigned: true
    t.integer "order_created_time", default: 0, null: false, comment: "下单时间", unsigned: true
    t.integer "order_cancelled_time", default: 0, null: false, comment: "关闭订单时间", unsigned: true
    t.integer "status_change_time", default: 0, null: false, comment: "状态变化的时间", unsigned: true
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.integer "order_total_price", default: 0, null: false, comment: "用户产品产生关系的订单价格", unsigned: true
    t.integer "favorite_time", default: 0, null: false, comment: "收藏时间", unsigned: true
    t.integer "become_auditor_time", default: 0, null: false, comment: "加入旁听生时间", unsigned: true
    t.integer "try_watched_time", default: 0, null: false, comment: "试看时间", unsigned: true
    t.index ["user_id", "product_id"], name: "i_userId_productId"
  end

  create_table "plugin_crm_query", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "title", limit: 1024, default: "", comment: "标题"
    t.integer "user_id", null: false, comment: "用户id", unsigned: true
    t.text "data", comment: "查询条件"
    t.string "color", default: "", null: false, comment: "显示颜色"
    t.integer "weight", default: 0, null: false, comment: "权重"
    t.string "remark", limit: 1204, default: "", null: false, comment: "备注"
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.boolean "sticky", default: false, comment: "置顶", unsigned: true
    t.integer "last_marketing_time", default: 0, comment: "最后营销时间", unsigned: true
  end

  create_table "plugin_crm_sync_parameter", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "method", null: false, comment: "方法名"
    t.string "arguments", default: "", null: false, comment: "参数"
    t.string "type", limit: 32, comment: "类型"
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.boolean "init", default: false, null: false, comment: "job是否初始化成功"
    t.index ["method"], name: "method", unique: true
  end

  create_table "plugin_crm_user", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "source_id", null: false, unsigned: true
    t.string "nickname", limit: 64, default: "", null: false, comment: "用户名"
    t.string "truename", default: "", null: false, comment: "真实姓名"
    t.string "qq", limit: 32, default: "", null: false, comment: "qq号码"
    t.string "weixin", default: "", null: false, comment: "微信号码"
    t.string "email", limit: 128, null: false, comment: "邮件"
    t.string "mobile", limit: 32, default: "", null: false, comment: "手机号码"
    t.boolean "mobile_verified", default: false, null: false, comment: "手机是否验证0为格式不正确，1格式正确，2已验证"
    t.integer "last_sms_marketing_time", default: 0, null: false, comment: "最后一次短信营销时间", unsigned: true
    t.integer "last_email_marketing_time", default: 0, null: false, comment: "最后一次邮件营销时间", unsigned: true
    t.integer "last_message_marketing_time", default: 0, null: false, comment: "最后一次私信营销时间", unsigned: true
    t.integer "consume_amount", default: 0, null: false, comment: "消费金额，单位分"
    t.integer "cash_account", default: 0, null: false, comment: "账户余额，单位分"
    t.integer "coin_account", default: 0, null: false, comment: "用户虚拟币余额"
    t.integer "per_customer_transaction", default: 0, null: false, comment: "客单价"
    t.integer "level_id", default: 0, null: false, comment: "vip Id", unsigned: true
    t.string "level_name", limit: 32, comment: "vip名称"
    t.integer "level_deadline", default: 0, null: false, comment: "vip到期时间", unsigned: true
    t.string "register_ip", limit: 64, default: "0", comment: "注册IP"
    t.string "gender", limit: 6, default: "secret", comment: "性别"
    t.string "idcard", limit: 24, default: "", null: false, comment: "身份证号码"
    t.text "signature"
    t.text "about"
    t.string "company", default: "", null: false
    t.string "job", default: "", null: false
    t.string "register_type", limit: 32, default: "default", null: false, comment: "default默认为网站注册, weibo新浪微薄登录"
    t.integer "register_time", default: 0, null: false, unsigned: true
    t.integer "last_login_time", default: 0, null: false, unsigned: true
    t.integer "buy_times", default: 0, null: false, comment: "购买次数"
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "sync_time", default: 0, null: false, unsigned: true
    t.integer "last_buy_time", default: 0, comment: "最后一次购买时间"
    t.boolean "email_verified", default: false, null: false, comment: "邮箱是否验证"
    t.integer "login_success_times", default: 0, comment: "登录成功次数"
    t.integer "last_marketing_time", default: 0, comment: "最后营销时间", unsigned: true
    t.index ["source_id"], name: "source_id", unique: true
  end

  create_table "plugin_crm_user_tag", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id", null: false, comment: "crm用户id", unsigned: true
    t.integer "tag_id", null: false, comment: "es标签id", unsigned: true
    t.integer "weight", default: 0, null: false, comment: "权重"
    t.integer "updated_time", default: 0, null: false, unsigned: true
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.index ["user_id", "tag_id"], name: "i_userId_tagId"
  end

  create_table "plugin_crm_user_track", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id", null: false, unsigned: true
    t.string "module", limit: 32, default: "", null: false, comment: "模块"
    t.string "action", limit: 32, default: "", null: false
    t.text "message", comment: "信息"
    t.text "data"
    t.string "ip", default: "", null: false
    t.string "type", limit: 32, default: "", null: false, comment: "操作类型,用户行为／营销行为"
    t.string "source", default: "", null: false, comment: "来源"
    t.integer "created_time", default: 0, null: false, unsigned: true
    t.integer "sync_time", default: 0, null: false, unsigned: true
    t.index ["source"], name: "i_source"
  end

  create_table "question", id: :integer, comment: "题目ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "问题表", force: :cascade do |t|
    t.string "type", limit: 64, default: "", null: false, comment: "题目类型"
    t.text "stem", comment: "题干"
    t.float "score", default: 0.0, null: false, comment: "分数", unsigned: true
    t.text "answer", comment: "参考答案"
    t.text "analysis", comment: "解析"
    t.text "metas", comment: "题目元信息"
    t.integer "categoryId", default: 0, null: false, comment: "类别", unsigned: true
    t.string "difficulty", limit: 64, default: "normal", null: false, comment: "难度"
    t.string "target", default: "", null: false, comment: "从属于"
    t.integer "courseSetId", default: 0, null: false
    t.integer "courseId", default: 0, null: false, unsigned: true
    t.integer "lessonId", default: 0, null: false, unsigned: true
    t.integer "parentId", default: 0, comment: "材料父ID", unsigned: true
    t.integer "subCount", default: 0, null: false, comment: "子题数量", unsigned: true
    t.integer "finishedTimes", default: 0, null: false, comment: "完成次数", unsigned: true
    t.integer "passedTimes", default: 0, null: false, comment: "成功次数", unsigned: true
    t.integer "createdUserId", default: 0, null: false, unsigned: true
    t.integer "updatedUserId", default: 0, null: false, unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "更新时间", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "copyId", default: 0, null: false, comment: "复制问题对应Id"
  end

  create_table "question_8_0_18_backup", id: :integer, comment: "题目ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type", limit: 64, default: "", null: false, comment: "题目类型"
    t.text "stem", comment: "题干"
    t.float "score", default: 0.0, null: false, comment: "分数", unsigned: true
    t.text "answer", comment: "参考答案"
    t.text "analysis", comment: "解析"
    t.text "metas", comment: "题目元信息"
    t.integer "categoryId", default: 0, null: false, comment: "类别", unsigned: true
    t.string "difficulty", limit: 64, default: "normal", null: false, comment: "难度"
    t.string "target", default: "", null: false, comment: "从属于"
    t.integer "courseSetId", default: 0, null: false
    t.integer "courseId", default: 0, null: false, unsigned: true
    t.integer "lessonId", default: 0, null: false, unsigned: true
    t.integer "parentId", default: 0, comment: "材料父ID", unsigned: true
    t.integer "subCount", default: 0, null: false, comment: "子题数量", unsigned: true
    t.integer "finishedTimes", default: 0, null: false, comment: "完成次数", unsigned: true
    t.integer "passedTimes", default: 0, null: false, comment: "成功次数", unsigned: true
    t.integer "createdUserId", default: 0, null: false, unsigned: true
    t.integer "updatedUserId", default: 0, null: false, unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "更新时间", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "copyId", default: 0, null: false, comment: "复制问题对应Id"
  end

  create_table "question_analysis", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "答题分析表", force: :cascade do |t|
    t.integer "targetId", default: 0, null: false, unsigned: true
    t.string "targetType", limit: 30, null: false
    t.integer "activityId", default: 0, null: false, unsigned: true
    t.integer "questionId", null: false, unsigned: true
    t.integer "choiceIndex", default: 0, null: false, comment: "选项key", unsigned: true
    t.integer "firstAnswerCount", default: 0, null: false, unsigned: true
    t.integer "totalAnswerCount", default: 0, null: false, comment: "全部答题人数", unsigned: true
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.integer "updatedTime", default: 0, null: false, unsigned: true
  end

  create_table "question_category", id: :integer, comment: "题目类别ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "题库类别表", force: :cascade do |t|
    t.string "name", null: false, comment: "类别名称"
    t.string "target", default: "", null: false, comment: "从属于"
    t.integer "userId", default: 0, null: false, comment: "操作用户", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "更新时间", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "seq", default: 0, null: false, comment: "排序序号", unsigned: true
  end

  create_table "question_favorite", id: :integer, comment: "题目收藏ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "questionId", default: 0, null: false, comment: "被收藏的题目ID", unsigned: true
    t.string "targetType", limit: 50, default: "", null: false
    t.integer "targetId", default: 0, null: false, unsigned: true
    t.string "target", default: "", null: false, comment: "题目所属对象"
    t.integer "userId", default: 0, null: false, comment: "收藏人ID", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "收藏时间", unsigned: true
  end

  create_table "question_marker", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "弹题", force: :cascade do |t|
    t.integer "markerId", null: false, comment: "驻点Id", unsigned: true
    t.integer "questionId", null: false, comment: "问题Id", unsigned: true
    t.integer "seq", default: 0, null: false, comment: "排序", unsigned: true
    t.string "type", limit: 64, default: "", null: false, comment: "题目类型"
    t.text "stem", comment: "题干"
    t.text "answer", comment: "参考答案"
    t.text "analysis", comment: "解析"
    t.text "metas", comment: "题目元信息"
    t.string "difficulty", limit: 64, default: "normal", null: false, comment: "难度"
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.integer "updatedTime", default: 0, null: false, unsigned: true
  end

  create_table "question_marker_result", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "markerId", null: false, comment: "驻点Id", unsigned: true
    t.integer "questionMarkerId", default: 0, null: false, comment: "弹题ID", unsigned: true
    t.integer "taskId", default: 0, null: false, unsigned: true
    t.integer "userId", default: 0, null: false, comment: "做题人ID", unsigned: true
    t.string "status", limit: 9, default: "none", null: false, comment: "结果状态"
    t.text "answer"
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.integer "updatedTime", default: 0, null: false, unsigned: true
    t.index ["questionMarkerId", "taskId", "status"], name: "idx_qmid_taskid_stats"
  end

  create_table "ratelimit", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "_key", limit: 64, null: false
    t.string "data", limit: 32, null: false
    t.integer "deadline", null: false, unsigned: true
    t.index ["_key"], name: "_key", unique: true
  end

  create_table "recent_post_num", id: :integer, comment: "id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "黑名单表", force: :cascade do |t|
    t.string "ip", limit: 20, null: false, comment: "IP"
    t.string "type", null: false, comment: "类型"
    t.integer "num", default: 0, null: false, comment: "post次数", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "最后一次更新时间", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
  end

  create_table "referer_log", id: :integer, comment: "ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "模块(课程|班级|公开课|...)的访问来源日志", force: :cascade do |t|
    t.string "targetId", limit: 64, comment: "模块ID"
    t.string "targetType", limit: 64, null: false, comment: "模块类型"
    t.string "targetInnerType", limit: 64, comment: "模块自身的类型"
    t.string "refererUrl", limit: 1024, default: "", comment: "访问来源Url"
    t.string "refererHost", limit: 1024, default: "", comment: "访问来源Url"
    t.string "refererName", limit: 64, default: "", comment: "访问来源站点名称"
    t.integer "orderCount", default: 0, comment: "促成订单数", unsigned: true
    t.string "ip", limit: 64, comment: "访问者IP"
    t.text "userAgent", comment: "浏览器的标识"
    t.string "uri", limit: 1024, default: "", comment: "访问Url"
    t.integer "createdUserId", default: 0, null: false, comment: "访问者", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "访问时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "更新时间", unsigned: true
  end

  create_table "reward_point_account", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "积分账户", force: :cascade do |t|
    t.integer "userId", null: false, comment: "用户Id", unsigned: true
    t.integer "balance", default: 0, null: false, comment: "积分余额", unsigned: true
    t.integer "outflowAmount", default: 0, null: false, comment: "出账积分总数", unsigned: true
    t.integer "inflowAmount", default: 0, null: false, comment: "入账积分总数", unsigned: true
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.integer "updatedTime", default: 0, null: false, unsigned: true
  end

  create_table "reward_point_account_flow", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "积分帐目流水", force: :cascade do |t|
    t.integer "userId", null: false, comment: "用户ID", unsigned: true
    t.bigint "sn", null: false, comment: "账目流水号", unsigned: true
    t.string "type", limit: 32, default: "", null: false, comment: "inflow, outflow"
    t.string "way", default: "", null: false, comment: "积分获取方式"
    t.integer "amount", default: 0, null: false, comment: "金额(积分)"
    t.string "name", limit: 1024, default: "", null: false, comment: "帐目名称"
    t.integer "operator", null: false, comment: "操作员ID", unsigned: true
    t.integer "targetId", default: 0, null: false, comment: "流水所属对象ID", unsigned: true
    t.string "targetType", limit: 64, default: "", null: false, comment: "流水所属对象类型"
    t.string "note", default: "", null: false
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.integer "updatedTime", default: 0, null: false, unsigned: true
  end

  create_table "reward_point_product", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 60, default: "", null: false, comment: "商品名称"
    t.string "img", default: "", null: false, comment: "图片"
    t.float "price", default: 0.0, null: false, comment: "兑换价格（积分）", unsigned: true
    t.text "about", comment: "简介"
    t.integer "requireConsignee", limit: 1, default: 1, null: false, comment: "需要收货人", unsigned: true
    t.integer "requireTelephone", limit: 1, default: 1, null: false, comment: "需要联系电话", unsigned: true
    t.integer "requireEmail", limit: 1, default: 1, null: false, comment: "需要邮箱", unsigned: true
    t.integer "requireAddress", limit: 1, default: 1, null: false, comment: "需要地址", unsigned: true
    t.string "status", limit: 32, default: "draft", comment: "商品状态  draft|published"
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.integer "updatedTime", default: 0, null: false, unsigned: true
  end

  create_table "reward_point_product_order", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sn", limit: 60, default: "", null: false, comment: "订单号"
    t.integer "productId", null: false, comment: "商品Id", unsigned: true
    t.string "title", limit: 60, default: "", null: false, comment: "订单名称"
    t.float "price", default: 0.0, null: false, comment: "兑换价格（积分）", unsigned: true
    t.integer "userId", null: false, comment: "用户Id", unsigned: true
    t.string "consignee", limit: 128, default: "", null: false, comment: "收货人"
    t.string "telephone", limit: 20, default: "", null: false, comment: "联系电话"
    t.string "email", limit: 50, default: "", null: false, comment: "邮箱"
    t.string "address", default: "", null: false, comment: "需要地址"
    t.integer "sendTime", default: 0, null: false, unsigned: true
    t.string "message", limit: 100, default: "", null: false, comment: "发货留言"
    t.string "status", limit: 32, default: "created", comment: "发货状态  created|sending|finished"
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.integer "updatedTime", default: 0, null: false, unsigned: true
  end

  create_table "role", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 32, null: false, comment: "权限名称"
    t.string "code", limit: 32, null: false, comment: "权限代码"
    t.text "data", comment: "权限配置"
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "createdUserId", null: false, comment: "创建用户ID", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "更新时间", unsigned: true
  end

  create_table "sessions", primary_key: "sess_id", id: :binary, limit: 128, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "sess_user_id", default: 0, null: false, unsigned: true
    t.binary "sess_data", null: false
    t.integer "sess_time", null: false, unsigned: true
    t.integer "sess_lifetime", limit: 3, null: false
    t.integer "id", comment: "主键", unsigned: true
    t.integer "sess_deadline", null: false, unsigned: true
  end

  create_table "setting", id: :integer, comment: "系统设置ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 64, default: "", null: false, comment: "系统设置名"
    t.binary "value", limit: 4294967295, comment: "系统设置值"
    t.string "namespace", default: "default", null: false
    t.index ["name", "namespace"], name: "name", unique: true
  end

  create_table "shortcut", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", null: false, unsigned: true
    t.string "title", default: "", null: false
    t.string "url", default: "", null: false
    t.integer "createdTime", default: 0, null: false, unsigned: true
  end

  create_table "sign_card", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", default: 0, null: false, unsigned: true
    t.integer "cardNum", default: 0, null: false, unsigned: true
    t.integer "useTime", default: 0, null: false, unsigned: true
  end

  create_table "sign_target_statistics", id: :integer, comment: "系统id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "targetType", default: "", null: false, comment: "签到目标类型"
    t.integer "targetId", default: 0, null: false, comment: "签到目标id", unsigned: true
    t.integer "signedNum", default: 0, null: false, comment: "签到人数", unsigned: true
    t.integer "date", default: 0, null: false, comment: "统计日期", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
  end

  create_table "sign_user_log", id: :integer, comment: "系统id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", default: 0, null: false, comment: "用户id", unsigned: true
    t.string "targetType", default: "", null: false, comment: "签到目标类型"
    t.integer "targetId", default: 0, null: false, comment: "签到目标id", unsigned: true
    t.integer "rank", default: 0, null: false, comment: "签到排名", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "签到时间", unsigned: true
  end

  create_table "sign_user_statistics", id: :integer, comment: "系统id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", default: 0, null: false, comment: "用户id", unsigned: true
    t.string "targetType", default: "", null: false, comment: "签到目标类型"
    t.integer "targetId", default: 0, null: false, comment: "签到目标id", unsigned: true
    t.integer "keepDays", default: 0, null: false, comment: "连续签到天数", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
  end

  create_table "status", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", null: false, comment: "动态发布的人", unsigned: true
    t.integer "courseId", default: 0, null: false, comment: "课程Id", unsigned: true
    t.integer "classroomId", default: 0, null: false, comment: "班级id", unsigned: true
    t.string "type", limit: 64, null: false, comment: "动态类型"
    t.string "objectType", limit: 64, default: "", null: false, comment: "动态对象的类型"
    t.integer "objectId", default: 0, null: false, comment: "动态对象ID", unsigned: true
    t.text "message", null: false, comment: "动态的消息体"
    t.text "properties", null: false, comment: "动态的属性"
    t.integer "commentNum", default: 0, null: false, comment: "评论数", unsigned: true
    t.integer "likeNum", default: 0, null: false, comment: "被赞的数量", unsigned: true
    t.boolean "private", default: false, null: false, comment: "是否隐藏", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "动态发布时间", unsigned: true
    t.index ["courseId", "createdTime"], name: "courseId_createdTime"
    t.index ["createdTime"], name: "createdTime"
    t.index ["userId"], name: "userId"
  end

  create_table "subtitle", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "字幕关联表", force: :cascade do |t|
    t.string "name", null: false, comment: "字幕名称"
    t.integer "subtitleId", null: false, comment: "subtitle的uploadFileId", unsigned: true
    t.integer "mediaId", null: false, comment: "video/audio的uploadFileId", unsigned: true
    t.string "ext", limit: 12, default: "", null: false, comment: "后缀"
    t.integer "createdTime", default: 0, null: false, unsigned: true
  end

  create_table "tag", id: :integer, comment: "标签ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 64, null: false, comment: "标签名称"
    t.integer "createdTime", null: false, comment: "标签创建时间", unsigned: true
    t.integer "orgId", default: 1, unsigned: true
    t.string "orgCode", default: "1.", comment: "组织机构内部编码"
    t.index ["name"], name: "name", unique: true
  end

  create_table "tag_group", id: :integer, comment: "标签ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "标签组表", force: :cascade do |t|
    t.string "name", default: "", null: false, comment: "标签组名字"
    t.string "scope", default: "", null: false, comment: "标签组应用范围"
    t.integer "tagNum", default: 0, null: false, comment: "标签组里的标签数量"
    t.integer "updatedTime", default: 0, null: false, comment: "更新时间"
    t.integer "createdTime", default: 0, null: false, comment: "创建时间"
  end

  create_table "tag_group_tag", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "标签组跟标签的中间表", force: :cascade do |t|
    t.integer "tagId", default: 0, null: false, comment: "标签ID"
    t.integer "groupId", default: 0, null: false, comment: "标签组ID"
  end

  create_table "tag_owner", id: :integer, comment: "标签ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "标签关系表", force: :cascade do |t|
    t.string "ownerType", default: "", null: false, comment: "标签拥有者类型"
    t.integer "ownerId", default: 0, null: false, comment: "标签拥有者id"
    t.integer "tagId", default: 0, null: false, comment: "标签id"
    t.integer "userId", default: 0, null: false, comment: "操作用户id"
    t.integer "createdTime", default: 0, null: false, unsigned: true
  end

  create_table "task", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", comment: "任务标题"
    t.text "description", comment: "任务描述"
    t.text "meta", comment: "任务元信息"
    t.integer "userId", default: 0, null: false
    t.string "taskType", limit: 100, null: false, comment: "任务类型"
    t.integer "batchId", default: 0, null: false, comment: "批次Id"
    t.integer "targetId", default: 0, null: false, comment: "类型id,可以是课时id,作业id等"
    t.string "targetType", limit: 100, comment: "类型,可以是课时,作业等"
    t.integer "taskStartTime", default: 0, null: false, comment: "任务开始时间"
    t.integer "taskEndTime", default: 0, null: false, comment: "任务结束时间"
    t.integer "intervalDate", limit: 2, default: 0, null: false, comment: "历时天数", unsigned: true
    t.string "status", limit: 9, default: "active", null: false
    t.boolean "required", default: false, null: false, comment: "是否为必做任务,0否,1是"
    t.integer "completedTime", default: 0, null: false, comment: "任务完成时间"
    t.integer "createdTime", default: 0, null: false
  end

  create_table "testpaper", id: :integer, comment: "试卷ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false, comment: "试卷名称"
    t.text "description", comment: "试卷说明"
    t.integer "limitedTime", default: 0, null: false, comment: "限时(单位：秒)", unsigned: true
    t.string "pattern", default: "", null: false, comment: "试卷生成/显示模式"
    t.string "target", default: "", null: false, comment: "试卷所属对象"
    t.string "status", limit: 32, default: "draft", null: false, comment: "试卷状态：draft,open,closed"
    t.float "score", default: 0.0, null: false, comment: "总分", unsigned: true
    t.float "passedScore", default: 0.0, null: false, comment: "通过考试的分数线", unsigned: true
    t.integer "itemCount", default: 0, null: false, comment: "题目数量", unsigned: true
    t.integer "createdUserId", default: 0, null: false, comment: "创建人", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "updatedUserId", default: 0, null: false, comment: "修改人", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "修改时间", unsigned: true
    t.text "metas", comment: "题型排序"
    t.integer "copyId", default: 0, null: false, comment: "复制试卷对应Id"
  end

  create_table "testpaper_item", id: :integer, comment: "试卷条目ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "testId", default: 0, null: false, comment: "所属试卷", unsigned: true
    t.integer "seq", default: 0, null: false, comment: "题目顺序", unsigned: true
    t.integer "questionId", default: 0, null: false, comment: "题目ID", unsigned: true
    t.string "questionType", limit: 64, default: "", null: false, comment: "题目类别"
    t.integer "parentId", default: 0, null: false, comment: "父题ID", unsigned: true
    t.float "score", default: 0.0, null: false, comment: "分值", unsigned: true
    t.float "missScore", default: 0.0, null: false, comment: "漏选得分", unsigned: true
  end

  create_table "testpaper_item_result", id: :integer, comment: "试卷题目做题结果ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "itemId", default: 0, null: false, comment: "试卷条目ID", unsigned: true
    t.integer "testId", default: 0, null: false, comment: "试卷ID", unsigned: true
    t.integer "testPaperResultId", default: 0, null: false, comment: "试卷结果ID", unsigned: true
    t.integer "userId", default: 0, null: false, comment: "做题人ID", unsigned: true
    t.integer "questionId", default: 0, null: false, comment: "题目ID", unsigned: true
    t.string "status", limit: 9, default: "none", null: false, comment: "结果状态"
    t.float "score", default: 0.0, null: false, comment: "得分"
    t.text "answer", comment: "回答"
    t.text "teacherSay", comment: "老师评价"
    t.integer "pId", default: 0, null: false, comment: "复制试卷题目Id", unsigned: true
    t.index ["testPaperResultId"], name: "testPaperResultId"
  end

  create_table "testpaper_item_result_v8", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "itemId", default: 0, null: false, comment: "试卷题目id", unsigned: true
    t.integer "testId", default: 0, null: false, unsigned: true
    t.integer "resultId", default: 0, null: false, comment: "试卷结果ID"
    t.integer "userId", default: 0, null: false, unsigned: true
    t.integer "questionId", default: 0, null: false, unsigned: true
    t.string "status", limit: 9, default: "none", null: false
    t.float "score", default: 0.0, null: false
    t.text "answer"
    t.text "teacherSay"
    t.integer "pId", default: 0, null: false, comment: "复制试卷题目Id", unsigned: true
    t.string "type", limit: 32, default: "testpaper", null: false, comment: "测验类型"
    t.integer "migrateItemResultId", default: 0, null: false, unsigned: true
    t.index ["resultId", "type"], name: "resultId_type"
    t.index ["resultId"], name: "testPaperResultId"
    t.index ["testId", "type"], name: "testId_type"
  end

  create_table "testpaper_item_v8", id: :integer, comment: "题目", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "testId", default: 0, null: false, comment: "所属试卷", unsigned: true
    t.integer "seq", default: 0, null: false, comment: "题目顺序", unsigned: true
    t.integer "questionId", default: 0, null: false, comment: "题目id", unsigned: true
    t.string "questionType", limit: 64, default: "", null: false, comment: "题目类别"
    t.integer "parentId", default: 0, null: false, unsigned: true
    t.float "score", default: 0.0, null: false, comment: "分值", unsigned: true
    t.float "missScore", default: 0.0, null: false, unsigned: true
    t.integer "copyId", default: 0, null: false, comment: "复制来源testpaper_item的id"
    t.string "type", limit: 32, default: "testpaper", null: false, comment: "测验类型"
    t.integer "migrateItemId", default: 0, null: false, unsigned: true
    t.index ["testId"], name: "testId"
  end

  create_table "testpaper_result", id: :integer, comment: "试卷结果ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "paperName", default: "", null: false, comment: "试卷名称"
    t.integer "testId", default: 0, null: false, comment: "试卷ID", unsigned: true
    t.integer "userId", default: 0, null: false, comment: "做卷人ID", unsigned: true
    t.float "score", default: 0.0, null: false, comment: "总分", unsigned: true
    t.float "objectiveScore", default: 0.0, null: false, comment: "主观题得分", unsigned: true
    t.float "subjectiveScore", default: 0.0, null: false, comment: "客观题得分", unsigned: true
    t.text "teacherSay", comment: "老师评价"
    t.integer "rightItemCount", default: 0, null: false, comment: "正确题目数", unsigned: true
    t.string "passedStatus", limit: 9, default: "none", null: false, comment: "考试通过状态，none表示该考试没有"
    t.integer "limitedTime", default: 0, null: false, comment: "试卷限制时间(秒)", unsigned: true
    t.integer "beginTime", default: 0, null: false, comment: "开始时间", unsigned: true
    t.integer "endTime", default: 0, null: false, comment: "结束时间", unsigned: true
    t.integer "updateTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.integer "active", limit: 1, default: 0, null: false, unsigned: true
    t.string "status", limit: 9, null: false, comment: "状态"
    t.string "target", default: "", null: false, comment: "试卷结果所属对象"
    t.integer "checkTeacherId", default: 0, null: false, comment: "批卷老师ID", unsigned: true
    t.integer "checkedTime", default: 0, null: false, comment: "批卷时间"
    t.integer "usedTime", default: 0, null: false, unsigned: true
  end

  create_table "testpaper_result_v8", id: :integer, comment: "id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "paperName", default: "", null: false
    t.integer "testId", default: 0, null: false, comment: "testId", unsigned: true
    t.integer "userId", default: 0, null: false, comment: "UserId", unsigned: true
    t.integer "courseId", default: 0, null: false
    t.integer "lessonId", default: 0, null: false
    t.float "score", default: 0.0, null: false, comment: "分数", unsigned: true
    t.float "objectiveScore", default: 0.0, null: false, unsigned: true
    t.float "subjectiveScore", default: 0.0, null: false, unsigned: true
    t.text "teacherSay"
    t.integer "rightItemCount", default: 0, null: false, unsigned: true
    t.string "passedStatus", limit: 9, default: "none", null: false, comment: "考试通过状态，none表示该考试没有"
    t.integer "limitedTime", default: 0, null: false, comment: "试卷限制时间(秒)", unsigned: true
    t.integer "beginTime", default: 0, null: false, comment: "开始时间", unsigned: true
    t.integer "endTime", default: 0, null: false, comment: "结束时间", unsigned: true
    t.integer "updateTime", default: 0, null: false, unsigned: true
    t.text "metas", comment: "练习的题型排序等附属信息"
    t.integer "active", limit: 1, default: 0, null: false, unsigned: true
    t.string "status", limit: 9, null: false, comment: "状态"
    t.string "target", default: "", null: false
    t.integer "checkTeacherId", default: 0, null: false, unsigned: true
    t.integer "checkedTime", default: 0, null: false
    t.integer "usedTime", default: 0, null: false, unsigned: true
    t.string "type", limit: 32, default: "testpaper", null: false, comment: "测验类型"
    t.integer "courseSetId", default: 0, null: false, unsigned: true
    t.integer "migrateResultId", default: 0, null: false, unsigned: true
    t.index ["testId"], name: "testId"
  end

  create_table "testpaper_v8", id: :integer, comment: "id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false, comment: "试卷名称"
    t.text "description", comment: "试卷说明"
    t.integer "courseId", default: 0, null: false
    t.integer "lessonId", default: 0, null: false
    t.integer "limitedTime", default: 0, null: false, comment: "限时(单位：秒)", unsigned: true
    t.string "pattern", default: "", null: false, comment: "试卷生成/显示模式"
    t.string "target", default: "", null: false
    t.string "status", limit: 32, default: "draft", null: false, comment: "试卷状态：draft,open,closed"
    t.float "score", default: 0.0, null: false, comment: "总分", unsigned: true
    t.text "passedCondition"
    t.integer "itemCount", default: 0, null: false, comment: "题目数量", unsigned: true
    t.integer "createdUserId", default: 0, null: false, comment: "创建人", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "updatedUserId", default: 0, null: false, comment: "修改人", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "修改时间", unsigned: true
    t.text "metas", comment: "题型排序"
    t.integer "copyId", default: 0, null: false, comment: "复制试卷对应Id"
    t.string "type", limit: 32, default: "testpaper", null: false, comment: "测验类型"
    t.integer "courseSetId", default: 0, null: false, unsigned: true
    t.integer "migrateTestId", default: 0, null: false, unsigned: true
    t.index ["courseSetId"], name: "courseSetId"
  end

  create_table "testpaper_v8_8_0_18_backup", id: :integer, comment: "id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false, comment: "试卷名称"
    t.text "description", comment: "试卷说明"
    t.integer "courseId", default: 0, null: false
    t.integer "lessonId", default: 0, null: false
    t.integer "limitedTime", default: 0, null: false, comment: "限时(单位：秒)", unsigned: true
    t.string "pattern", default: "", null: false, comment: "试卷生成/显示模式"
    t.string "target", default: "", null: false
    t.string "status", limit: 32, default: "draft", null: false, comment: "试卷状态：draft,open,closed"
    t.float "score", default: 0.0, null: false, comment: "总分", unsigned: true
    t.text "passedCondition"
    t.integer "itemCount", default: 0, null: false, comment: "题目数量", unsigned: true
    t.integer "createdUserId", default: 0, null: false, comment: "创建人", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "updatedUserId", default: 0, null: false, comment: "修改人", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "修改时间", unsigned: true
    t.text "metas", comment: "题型排序"
    t.integer "copyId", default: 0, null: false, comment: "复制试卷对应Id"
    t.string "type", limit: 32, default: "testpaper", null: false, comment: "测验类型"
    t.integer "courseSetId", default: 0, null: false, unsigned: true
    t.integer "migrateTestId", default: 0, null: false, unsigned: true
  end

  create_table "theme_config", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "config"
    t.text "confirmConfig"
    t.text "allConfig"
    t.integer "updatedTime", default: 0, null: false
    t.integer "createdTime", default: 0, null: false
    t.integer "updatedUserId", default: 0, null: false
  end

  create_table "thread", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "targetType", default: "classroom", null: false, comment: "所属 类型"
    t.integer "targetId", default: 0, null: false, comment: "所属类型 ID", unsigned: true
    t.string "title", null: false, comment: "标题"
    t.text "content", comment: "内容"
    t.text "ats", comment: "@(提)到的人"
    t.integer "nice", default: 0, null: false, comment: "加精", unsigned: true
    t.integer "sticky", default: 0, null: false, comment: "置顶", unsigned: true
    t.integer "solved", limit: 1, default: 0, null: false, comment: "是否有老师回答(已被解决)", unsigned: true
    t.integer "lastPostUserId", default: 0, null: false, comment: "最后回复人ID", unsigned: true
    t.integer "lastPostTime", default: 0, null: false, comment: "最后回复时间", unsigned: true
    t.string "location", limit: 1024, comment: "地点"
    t.integer "userId", default: 0, null: false, comment: "用户ID", unsigned: true
    t.string "type", default: "", null: false, comment: "话题类型"
    t.integer "postNum", default: 0, null: false, comment: "回复数", unsigned: true
    t.integer "hitNum", default: 0, null: false, comment: "点击数", unsigned: true
    t.integer "memberNum", default: 0, null: false, comment: "成员人数", unsigned: true
    t.integer "maxUsers", default: 0, null: false, comment: "最大人数"
    t.string "actvityPicture", comment: "活动图片"
    t.string "status", limit: 6, default: "open", null: false, comment: "状态"
    t.integer "startTime", default: 0, null: false, comment: "开始时间", unsigned: true
    t.integer "endTime", default: 0, null: false, comment: "结束时间", unsigned: true
    t.integer "relationId", default: 0, null: false, comment: "从属ID", unsigned: true
    t.integer "categoryId", default: 0, null: false, comment: "分类ID", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "updateTime", default: 0, null: false, comment: "话题最后一次被编辑或回复时间", unsigned: true
    t.index ["updateTime"], name: "updateTime"
  end

  create_table "thread_member", id: :integer, comment: "系统Id", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "话题成员表", force: :cascade do |t|
    t.integer "threadId", null: false, comment: "话题Id", unsigned: true
    t.integer "userId", null: false, comment: "用户Id", unsigned: true
    t.string "nickname", comment: "昵称"
    t.string "truename", comment: "真实姓名"
    t.string "mobile", limit: 32, comment: "手机号码"
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
  end

  create_table "thread_post", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "threadId", default: 0, null: false, comment: "话题ID", unsigned: true
    t.text "content", null: false, comment: "内容"
    t.integer "adopted", limit: 1, default: 0, null: false, comment: "是否被采纳(是老师回答)", unsigned: true
    t.text "ats", comment: "@(提)到的人"
    t.integer "userId", default: 0, null: false, comment: "用户ID", unsigned: true
    t.integer "parentId", default: 0, null: false, comment: "父ID", unsigned: true
    t.integer "subposts", default: 0, null: false, comment: "子话题数量", unsigned: true
    t.integer "ups", default: 0, null: false, comment: "投票数", unsigned: true
    t.string "targetType", default: "classroom", null: false, comment: "所属 类型"
    t.integer "targetId", null: false, comment: "所属 类型ID", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
  end

  create_table "thread_vote", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "话题投票表", force: :cascade do |t|
    t.integer "threadId", null: false, comment: "话题ID", unsigned: true
    t.integer "postId", null: false, comment: "回帖ID", unsigned: true
    t.string "action", limit: 4, null: false, comment: "投票类型"
    t.integer "userId", null: false, comment: "投票人ID", unsigned: true
    t.integer "createdTime", null: false, comment: "投票时间", unsigned: true
    t.index ["threadId", "postId", "userId"], name: "postId", unique: true
  end

  create_table "upgrade_logs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "本地升级日志表", force: :cascade do |t|
    t.integer "remoteId", null: false, comment: "packageId"
    t.integer "installedId", comment: "本地已安装id"
    t.string "ename", limit: 32, null: false, comment: "名称"
    t.string "cname", limit: 32, null: false, comment: "中文名称"
    t.string "fromv", limit: 32, comment: "初始版本"
    t.string "tov", limit: 32, null: false, comment: "目标版本"
    t.integer "type", limit: 2, null: false, comment: "升级类型"
    t.text "dbBackPath", comment: "数据库备份文件"
    t.text "srcBackPath", comment: "源文件备份地址"
    t.string "status", limit: 32, null: false, comment: "状态(ROLLBACK,ERROR,SUCCESS,RECOVERED)"
    t.integer "logtime", null: false, comment: "升级时间"
    t.integer "uid", null: false, comment: "uid", unsigned: true
    t.string "ip", limit: 32, comment: "ip"
    t.text "reason", comment: "失败原因"
  end

  create_table "upgrade_notice", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "用户升级提示查看", force: :cascade do |t|
    t.integer "userId", null: false
    t.string "code", limit: 100, null: false, comment: "编码"
    t.string "version", limit: 100, null: false, comment: "版本号"
    t.integer "createdTime", null: false, comment: "创建时间"
  end

  create_table "upload_file_inits", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "globalId", limit: 32, default: "0", null: false, comment: "云文件ID"
    t.string "status", limit: 9, default: "ok", null: false, comment: "文件上传状态"
    t.string "hashId", limit: 128, default: "", null: false, comment: "文件的HashID"
    t.integer "targetId", null: false, comment: "所存目标id"
    t.string "targetType", limit: 64, default: "", null: false, comment: "目标类型"
    t.string "filename", limit: 1024, default: "", null: false
    t.string "ext", limit: 12, default: "", null: false, comment: "后缀"
    t.bigint "fileSize", default: 0, null: false
    t.string "etag", limit: 256, default: "", null: false
    t.integer "length", default: 0, null: false, unsigned: true
    t.string "convertHash", limit: 256, default: "", null: false, comment: "文件转换时的查询转换进度用的Hash值"
    t.string "convertStatus", limit: 7, default: "none", null: false
    t.text "metas"
    t.text "metas2"
    t.string "type", limit: 8, default: "other", null: false, comment: "文件类型"
    t.string "storage", limit: 5, null: false
    t.text "convertParams", comment: "文件转换参数"
    t.integer "updatedUserId", default: 0, null: false, comment: "更新用户名", unsigned: true
    t.integer "updatedTime", default: 0, unsigned: true
    t.integer "createdUserId", null: false, unsigned: true
    t.integer "createdTime", null: false, unsigned: true
    t.index ["hashId"], name: "hashId", unique: true
  end

  create_table "upload_files", id: :integer, unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "globalId", limit: 32, default: "0", null: false, comment: "云文件ID"
    t.string "hashId", limit: 128, default: "", null: false, comment: "文件的HashID"
    t.integer "targetId", null: false, comment: "所存目标ID"
    t.string "targetType", limit: 64, default: "", null: false, comment: "目标类型"
    t.string "useType", limit: 64, comment: "文件使用的模块类型"
    t.string "filename", limit: 1024, default: "", null: false, comment: "文件名"
    t.string "ext", limit: 12, default: "", null: false, comment: "后缀"
    t.integer "fileSize", default: 0, null: false, comment: "文件大小", unsigned: true
    t.string "etag", limit: 256, default: "", null: false, comment: "ETAG"
    t.integer "length", default: 0, null: false, comment: "长度（音视频则为时长，PPT/文档为页数）", unsigned: true
    t.text "description"
    t.string "status", limit: 9, default: "ok", null: false, comment: "文件上传状态"
    t.string "convertHash", limit: 128, default: "", null: false, comment: "文件转换时的查询转换进度用的Hash值"
    t.string "convertStatus", limit: 7, default: "none", null: false, comment: "文件转换状态"
    t.text "convertParams", comment: "文件转换参数"
    t.text "metas", comment: "元信息"
    t.text "metas2", comment: "元信息"
    t.string "type", limit: 8, default: "other", null: false, comment: "文件类型"
    t.string "storage", limit: 5, null: false, comment: "文件存储方式"
    t.integer "isPublic", limit: 1, default: 0, null: false, comment: "是否公开文件", unsigned: true
    t.integer "canDownload", limit: 1, default: 0, null: false, comment: "是否可下载"
    t.integer "usedCount", default: 0, null: false, unsigned: true
    t.integer "updatedUserId", default: 0, null: false, comment: "更新用户名", unsigned: true
    t.integer "updatedTime", default: 0, comment: "文件最后更新时间", unsigned: true
    t.integer "createdUserId", null: false, comment: "文件上传人", unsigned: true
    t.integer "createdTime", null: false, comment: "文件上传时间", unsigned: true
    t.string "audioConvertStatus", limit: 7, default: "none", null: false, comment: "视频转音频的状态"
    t.index ["convertHash"], name: "convertHash", unique: true, length: 64
    t.index ["hashId"], name: "hashId", unique: true, length: 120
  end

  create_table "upload_files_collection", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "文件收藏表", force: :cascade do |t|
    t.integer "fileId", null: false, comment: "文件Id", unsigned: true
    t.integer "userId", default: 0, null: false, comment: "收藏者", unsigned: true
    t.integer "createdTime", null: false, unsigned: true
    t.integer "updatedTime", default: 0, comment: "更新时间", unsigned: true
  end

  create_table "upload_files_share", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "sourceUserId", null: false, comment: "上传文件的用户ID", unsigned: true
    t.integer "targetUserId", null: false, comment: "文件分享目标用户ID", unsigned: true
    t.integer "isActive", limit: 1, default: 0, null: false, comment: "是否有效", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "创建时间", unsigned: true
  end

  create_table "upload_files_share_history", id: :integer, comment: "系统ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "sourceUserId", null: false, comment: "分享用户的ID"
    t.integer "targetUserId", null: false, comment: "被分享的用户的ID"
    t.integer "isActive", limit: 1, default: 0, null: false
    t.integer "createdTime", default: 0, comment: "创建时间"
  end

  create_table "upload_files_tag", id: :integer, comment: "系统ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "文件与标签的关联表", force: :cascade do |t|
    t.integer "fileId", default: 0, null: false, comment: "文件ID", unsigned: true
    t.integer "tagId", default: 0, null: false, comment: "标签ID", unsigned: true
  end

  create_table "user", id: :integer, comment: "用户ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", limit: 128, null: false, comment: "用户邮箱"
    t.string "verifiedMobile", limit: 32, default: "", null: false
    t.string "password", limit: 64, null: false, comment: "用户密码"
    t.string "salt", limit: 32, null: false, comment: "密码SALT"
    t.string "payPassword", limit: 64, default: "", null: false, comment: "支付密码"
    t.string "payPasswordSalt", limit: 64, default: "", null: false, comment: "支付密码Salt"
    t.string "locale", limit: 20
    t.string "uri", limit: 64, default: "", null: false, comment: "用户URI"
    t.string "nickname", limit: 64, null: false, comment: "昵称"
    t.string "title", default: "", null: false, comment: "头像"
    t.string "tags", default: "", null: false, comment: "标签"
    t.string "type", limit: 32, null: false, comment: "default默认为网站注册, weibo新浪微薄登录"
    t.integer "point", default: 0, null: false, comment: "积分"
    t.integer "coin", default: 0, null: false, comment: "金币"
    t.string "smallAvatar", default: "", null: false, comment: "小头像"
    t.string "mediumAvatar", default: "", null: false, comment: "中头像"
    t.string "largeAvatar", default: "", null: false, comment: "大头像"
    t.boolean "emailVerified", default: false, null: false, comment: "邮箱是否为已验证"
    t.integer "setup", limit: 1, default: 1, null: false, comment: "是否初始化设置的，未初始化的可以设置邮箱、昵称。"
    t.string "roles", null: false, comment: "用户角色"
    t.integer "promoted", limit: 1, default: 0, null: false, comment: "是否为推荐", unsigned: true
    t.integer "promotedSeq", default: 0, null: false, unsigned: true
    t.integer "promotedTime", default: 0, null: false, comment: "推荐时间", unsigned: true
    t.integer "locked", limit: 1, default: 0, null: false, comment: "是否被禁止", unsigned: true
    t.integer "lockDeadline", default: 0, null: false, comment: "帐号锁定期限"
    t.integer "consecutivePasswordErrorTimes", default: 0, null: false, comment: "帐号密码错误次数"
    t.integer "lastPasswordFailTime", default: 0, null: false
    t.integer "loginTime", default: 0, null: false, comment: "最后登录时间"
    t.string "loginIp", limit: 64, default: "", null: false, comment: "最后登录IP"
    t.string "loginSessionId", default: "", null: false, comment: "最后登录会话ID"
    t.integer "approvalTime", default: 0, null: false, comment: "实名认证时间", unsigned: true
    t.string "approvalStatus", limit: 12, default: "unapprove", null: false, comment: "实名认证状态"
    t.integer "newMessageNum", default: 0, null: false, comment: "未读私信数", unsigned: true
    t.integer "newNotificationNum", default: 0, null: false, comment: "未读消息数", unsigned: true
    t.string "createdIp", limit: 64, default: "", null: false, comment: "注册IP"
    t.integer "createdTime", default: 0, null: false, comment: "注册时间", unsigned: true
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间", unsigned: true
    t.string "inviteCode", comment: "邀请码"
    t.integer "orgId", default: 1, unsigned: true
    t.string "orgCode", default: "1.", comment: "组织机构内部编码"
    t.string "registeredWay", limit: 64, default: "", null: false, comment: "注册设备来源(web/ios/android)"
    t.string "distributorToken", default: "", null: false, comment: "分销平台token"
    t.string "uuid", default: "", null: false, comment: "用户uuid"
    t.index ["distributorToken"], name: "distributorToken"
    t.index ["email"], name: "email", unique: true
    t.index ["nickname"], name: "nickname", unique: true
    t.index ["type"], name: "user_type_index"
    t.index ["updatedTime"], name: "updatedTime"
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "user_active_log", id: :integer, comment: "ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "活跃用户记录表", force: :cascade do |t|
    t.integer "userId", null: false, comment: "用户Id"
    t.integer "activeTime", default: 0, null: false, comment: "激活时间", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
    t.index ["userId"], name: "createdTime"
  end

  create_table "user_approval", id: :integer, comment: "用户认证ID", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "用户认证表", force: :cascade do |t|
    t.integer "userId", null: false, comment: "用户ID"
    t.string "idcard", limit: 24, default: "", null: false, comment: "身份证号"
    t.string "faceImg", limit: 500, default: "", null: false, comment: "认证正面图"
    t.string "backImg", limit: 500, default: "", null: false, comment: "认证背面图"
    t.string "truename", comment: "真实姓名"
    t.text "note", comment: "认证信息"
    t.string "status", limit: 12, null: false, comment: "是否通过：1是 0否"
    t.integer "operatorId", comment: "审核人", unsigned: true
    t.integer "createdTime", default: 0, null: false, comment: "申请时间"
  end

  create_table "user_bind", id: :integer, comment: "用户绑定ID", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type", limit: 64, null: false, comment: "用户绑定类型"
    t.string "fromId", limit: 32, null: false, comment: "来源方用户ID"
    t.integer "toId", null: false, comment: "被绑定的用户ID", unsigned: true
    t.string "token", default: "", null: false, comment: "oauth token"
    t.string "refreshToken", default: "", null: false, comment: "oauth refresh token"
    t.integer "expiredTime", default: 0, null: false, comment: "token过期时间", unsigned: true
    t.integer "createdTime", null: false, comment: "绑定时间", unsigned: true
    t.index ["type", "fromId"], name: "type", unique: true
  end

  create_table "user_field", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "fieldName", limit: 100, default: "", null: false
    t.string "title", limit: 1024, default: "", null: false
    t.integer "seq", null: false, unsigned: true
    t.integer "enabled", default: 0, null: false, unsigned: true
    t.integer "createdTime", null: false, unsigned: true
  end

  create_table "user_fortune_log", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", null: false
    t.integer "number", null: false
    t.string "action", limit: 20, null: false
    t.string "note", default: "", null: false
    t.integer "createdTime", null: false
    t.string "type", limit: 20, null: false
  end

  create_table "user_learn_statistics_daily", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", null: false, comment: "用户Id", unsigned: true
    t.integer "joinedClassroomNum", default: 0, null: false, comment: "当天加入的班级数", unsigned: true
    t.integer "joinedCourseSetNum", default: 0, null: false, comment: "当天加入的非班级课程数", unsigned: true
    t.integer "joinedCourseNum", default: 0, null: false, comment: "当天加入的非班级计划数", unsigned: true
    t.integer "exitClassroomNum", default: 0, null: false, comment: " 当天退出的班级数", unsigned: true
    t.integer "exitCourseSetNum", default: 0, null: false, comment: "当天退出的非班级课程数", unsigned: true
    t.integer "exitCourseNum", default: 0, null: false, comment: "当天退出的非班级计划数", unsigned: true
    t.integer "learnedSeconds", default: 0, null: false, comment: "学习时长", unsigned: true
    t.integer "finishedTaskNum", default: 0, null: false, comment: " 当天学完的任务数量", unsigned: true
    t.integer "paidAmount", default: 0, null: false, comment: "支付金额"
    t.integer "refundAmount", default: 0, null: false, comment: "退款金额"
    t.integer "actualAmount", default: 0, null: false, comment: "实付金额"
    t.integer "recordTime", default: 0, null: false, comment: "记录时间, 当天同步时间的0点", unsigned: true
    t.integer "isStorage", limit: 1, default: 0, null: false, comment: "是否存储到total表", unsigned: true
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.integer "updatedTime", default: 0, null: false, unsigned: true
    t.index ["userId", "recordTime"], name: "userId", unique: true
    t.index ["userId"], name: "index_user_id"
  end

  create_table "user_learn_statistics_total", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", null: false, comment: "用户Id", unsigned: true
    t.integer "joinedClassroomNum", default: 0, null: false, comment: "加入的班级数", unsigned: true
    t.integer "joinedCourseSetNum", default: 0, null: false, comment: "加入的非班级课程数", unsigned: true
    t.integer "joinedCourseNum", default: 0, null: false, comment: "加入的非班级计划数", unsigned: true
    t.integer "exitClassroomNum", default: 0, null: false, comment: "退出的班级数", unsigned: true
    t.integer "exitCourseSetNum", default: 0, null: false, comment: "退出的非班级课程数", unsigned: true
    t.integer "exitCourseNum", default: 0, null: false, comment: "退出的非班级计划数", unsigned: true
    t.integer "learnedSeconds", default: 0, null: false, comment: "学习时长", unsigned: true
    t.integer "finishedTaskNum", default: 0, null: false, comment: "学完的任务数量", unsigned: true
    t.integer "paidAmount", default: 0, null: false, comment: "支付金额"
    t.integer "refundAmount", default: 0, null: false, comment: "退款金额"
    t.integer "actualAmount", default: 0, null: false, comment: "实付金额"
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.integer "updatedTime", default: 0, null: false, unsigned: true
    t.index ["userId"], name: "index_user_id"
    t.index ["userId"], name: "userId", unique: true
  end

  create_table "user_pay_agreement", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "用户授权银行", force: :cascade do |t|
    t.integer "userId", null: false, comment: "用户Id"
    t.integer "type", default: 0, null: false, comment: "0:储蓄卡1:信用卡"
    t.string "bankName", null: false, comment: "银行名称"
    t.integer "bankNumber", null: false, comment: "银行卡号"
    t.string "userAuth", limit: 225, comment: "用户授权"
    t.string "bankAuth", limit: 225, null: false, comment: "银行授权码"
    t.integer "bankId", null: false, comment: "对应的银行Id"
    t.integer "updatedTime", default: 0, null: false, comment: "最后更新时间"
    t.integer "createdTime", default: 0, null: false, comment: "创建时间"
  end

  create_table "user_profile", id: :integer, comment: "用户ID", unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "truename", default: "", null: false, comment: "真实姓名"
    t.string "idcard", limit: 24, default: "", null: false, comment: "身份证号码"
    t.string "gender", limit: 6, default: "secret", null: false, comment: "性别"
    t.string "iam", default: "", null: false, comment: "我是谁"
    t.date "birthday", comment: "生日"
    t.string "city", limit: 64, default: "", null: false, comment: "城市"
    t.string "mobile", limit: 32, default: "", null: false, comment: "手机"
    t.string "qq", limit: 32, default: "", null: false, comment: "QQ"
    t.text "signature", comment: "签名"
    t.text "about", comment: "自我介绍"
    t.string "company", default: "", null: false, comment: "公司"
    t.string "job", default: "", null: false, comment: "工作"
    t.string "school", default: "", null: false, comment: "学校"
    t.string "class", default: "", null: false, comment: "班级"
    t.string "weibo", default: "", null: false, comment: "微博"
    t.string "weixin", default: "", null: false, comment: "微信"
    t.integer "isQQPublic", default: 0, null: false
    t.integer "isWeixinPublic", default: 0, null: false
    t.integer "isWeiboPublic", default: 0, null: false
    t.string "site", default: "", null: false, comment: "网站"
    t.integer "intField1"
    t.integer "intField2"
    t.integer "intField3"
    t.integer "intField4"
    t.integer "intField5"
    t.date "dateField1"
    t.date "dateField2"
    t.date "dateField3"
    t.date "dateField4"
    t.date "dateField5"
    t.float "floatField1"
    t.float "floatField2"
    t.float "floatField3"
    t.float "floatField4"
    t.float "floatField5"
    t.string "varcharField1", limit: 1024
    t.string "varcharField2", limit: 1024
    t.string "varcharField3", limit: 1024
    t.string "varcharField4", limit: 1024
    t.string "varcharField5", limit: 1024
    t.string "varcharField6", limit: 1024
    t.string "varcharField7", limit: 1024
    t.string "varcharField8", limit: 1024
    t.string "varcharField9", limit: 1024
    t.string "varcharField10", limit: 1024
    t.text "textField1"
    t.text "textField2"
    t.text "textField3"
    t.text "textField4"
    t.text "textField5"
    t.text "textField6"
    t.text "textField7"
    t.text "textField8"
    t.text "textField9"
    t.text "textField10"
  end

  create_table "user_secure_question", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userId", default: 0, null: false, comment: "用户ID", unsigned: true
    t.string "securityQuestionCode", limit: 64, default: "", null: false, comment: "问题的code"
    t.string "securityAnswer", limit: 64, default: "", null: false, comment: "安全问题的答案"
    t.string "securityAnswerSalt", limit: 64, default: "", null: false, comment: "安全问题的答案Salt"
    t.integer "createdTime", default: 0, null: false, comment: "创建时间", unsigned: true
  end

  create_table "user_token", id: :integer, comment: "TOKEN编号", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "token", limit: 64, null: false, comment: "TOKEN值"
    t.integer "userId", default: 0, null: false, comment: "TOKEN关联的用户ID", unsigned: true
    t.string "type", null: false, comment: "TOKEN类型"
    t.text "data", null: false, comment: "TOKEN数据"
    t.integer "times", default: 0, null: false, comment: "TOKEN的校验次数限制(0表示不限制)", unsigned: true
    t.integer "remainedTimes", default: 0, null: false, comment: "TOKE剩余校验次数", unsigned: true
    t.integer "expiredTime", default: 0, null: false, comment: "TOKEN过期时间", unsigned: true
    t.integer "createdTime", null: false, comment: "TOKEN创建时间", unsigned: true
    t.index ["token"], name: "token", unique: true, length: 60
  end

  create_table "vip", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "会员表", force: :cascade do |t|
    t.integer "userId", null: false
    t.integer "levelId", null: false, unsigned: true
    t.integer "deadline", null: false, unsigned: true
    t.string "boughtType", limit: 7, null: false, comment: "购买类型"
    t.integer "boughtTime", default: 0, null: false, comment: "购买时间", unsigned: true
    t.integer "boughtDuration", default: 0, null: false, comment: "购买时长", unsigned: true
    t.string "boughtUnit", limit: 5, null: false, comment: "开通方式按月、按年"
    t.float "boughtAmount", default: 0.0, null: false
    t.integer "orderId", default: 0, null: false, comment: "购买会员的订单ID", unsigned: true
    t.integer "deadlineNotified", default: 0, null: false
    t.integer "operatorId", default: 0, null: false, comment: "管理员操作时为管理员用户ID", unsigned: true
    t.integer "createdTime", default: 0
    t.index ["userId"], name: "userId", unique: true
  end

  create_table "vip_history", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "会员记录表", force: :cascade do |t|
    t.integer "userId", null: false, comment: "购买用户", unsigned: true
    t.integer "levelId", default: 0, null: false, comment: "会员类型", unsigned: true
    t.integer "deadline", default: 0, null: false, unsigned: true
    t.string "boughtType", limit: 7, null: false, comment: "购买类型"
    t.integer "boughtTime", default: 0, null: false, unsigned: true
    t.integer "boughtDuration", default: 0, null: false, unsigned: true
    t.string "boughtUnit", limit: 5, default: "none", null: false
    t.float "boughtAmount", default: 0.0, null: false, comment: "购买金额", unsigned: true
    t.integer "orderId", default: 0, null: false, comment: "购买会员的订单ID", unsigned: true
    t.integer "operatorId", default: 0, null: false, comment: "管理员操作时为管理员用户ID", unsigned: true
    t.integer "createdTime", default: 0, null: false, unsigned: true
    t.string "priceType", default: "", null: false, comment: "价格类型"
  end

  create_table "vip_level", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "会员类型表", force: :cascade do |t|
    t.integer "seq", default: 0, null: false, comment: "序号", unsigned: true
    t.string "name", limit: 64, default: "", null: false, comment: "会员类型名称"
    t.string "icon", default: "", null: false, comment: "示意图标"
    t.string "picture", default: "", null: false, comment: "展示图片"
    t.float "monthPrice", default: 0.0, null: false, comment: "月费价格", unsigned: true
    t.float "yearPrice", default: 0.0, null: false, comment: "年费价格", unsigned: true
    t.text "description", comment: "一句话描述"
    t.integer "freeLearned", limit: 1, default: 0, null: false, comment: "是否免费学习课程", unsigned: true
    t.integer "enabled", limit: 1, default: 0, null: false, comment: "状态", unsigned: true
    t.integer "createdTime", null: false, unsigned: true
    t.integer "maxRate", limit: 1, default: 100, null: false, comment: "最大抵扣百分比", unsigned: true
  end

  create_table "xapi_activity_watch_log", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false, comment: "用户ID", unsigned: true
    t.integer "activity_id", comment: "教学活动ID"
    t.integer "course_id", comment: "教学计划ID"
    t.integer "task_id", comment: "任务ID"
    t.integer "watched_time", null: false, comment: "观看时长", unsigned: true
    t.integer "created_time", null: false, comment: "创建时间", unsigned: true
    t.integer "updated_time", null: false, comment: "更新时间", unsigned: true
    t.integer "is_push", limit: 1, default: 0, null: false, comment: "是否推送", unsigned: true
  end

  create_table "xapi_statement", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "uuid", limit: 64, null: false
    t.string "version", limit: 32, default: "", null: false, comment: "版本号"
    t.integer "push_time", default: 0, null: false, comment: "上报时间", unsigned: true
    t.integer "user_id", default: 0, null: false, comment: "所属用户", unsigned: true
    t.string "verb", limit: 32, default: "", null: false, comment: "用户行为"
    t.integer "target_id", comment: "目标Id"
    t.string "target_type", limit: 32, null: false, comment: "目标类型"
    t.string "status", limit: 16, default: "created", null: false, comment: "状态: created, pushing, pushed"
    t.text "context", comment: "上下文信息"
    t.text "data", comment: "数据"
    t.integer "created_time", null: false, comment: "创建时间", unsigned: true
    t.integer "occur_time", null: false, comment: "行为发生时间", unsigned: true
    t.index ["uuid"], name: "uuid", unique: true
  end

  create_table "xapi_statement_archive", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "uuid", limit: 64, null: false
    t.string "version", limit: 32, default: "", null: false, comment: "版本号"
    t.integer "push_time", default: 0, null: false, comment: "上报时间", unsigned: true
    t.integer "user_id", default: 0, null: false, comment: "所属用户", unsigned: true
    t.string "verb", limit: 32, default: "", null: false, comment: "用户行为"
    t.integer "target_id", comment: "目标Id"
    t.string "target_type", limit: 32, null: false, comment: "目标类型"
    t.string "status", limit: 16, default: "created", null: false, comment: "状态: created, pushing, pushed"
    t.text "data", comment: "数据"
    t.integer "occur_time", null: false, comment: "行为发生时间", unsigned: true
    t.integer "created_time", null: false, comment: "创建时间", unsigned: true
    t.index ["uuid"], name: "uuid", unique: true
  end

end

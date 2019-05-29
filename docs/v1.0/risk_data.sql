INSERT INTO `risk_variable` (`id`, `name`, `catalog`, `code`, `remark`, `status`, `create_time`, `update_time`)
VALUES
	(8, '淘气值', 4, 'tb_tao_score', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(9, '是否已认证', 4, 'tb_account_auth', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(10, '本人地址变化情况', 4, 'tb_self_addr_change', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(11, '本人城市变化情况', 4, 'tb_self_city_change', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(12, '非本人收件地址变化情况', 4, 'tb_nonself_addr_change', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(13, 'TOP n 的手机号码是否在通讯录中', 4, 'tb_deliver_phone_in_contractes', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(14, '近＊月最多收件人姓名是否为实名认真的姓名', 4, 'tb_max_deliver_name_is_self', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(15, '近＊月最多收件人电话是否为注册的手机号码', 4, 'tb_max_deliver_phone_is_self', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(16, '总成长值', 4, 'tb_userinfo_sum_vipcount_tmallapass', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(17, '最早一笔订单记录距今天数', 4, 'tb_userinfo_length_day_firstorder', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(18, '150天内交易成功的记录条数', 4, 'tb_ti_freq_success_150d', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(19, '150天内交易成功且最大订单金额', 4, 'tb_ti_max_actualfee_success_150d', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(20, '150天内交易成功的平均订单金额', 4, 'tb_ti_avg_actualfee_success_150d', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(21, '150天内交易成功的订单金额总和', 4, 'tb_ti_sum_actualfee_success_150d', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(22, '150天内虚拟商品的交易金额总和', 4, 'tb_so_sum_realtotal_virtual_150d', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(23, '150天内虚拟商品的交易金额总和占比', 4, 'tb_so_ratio_sum_realtotal_virtual_150d', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(24, '150天内虚拟商品的次数', 4, 'tb_so_freq_record_virtual_150d', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(25, '近30天内消费额度总和', 4, 'taobao_ti_sum_actualfee_30d', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27'),
	(26, '近90天内消费额度总和', 4, 'taobao_ti_sum_actualfee_90d', '', 1, '2018-11-14 10:31:27', '2018-11-14 10:31:27');
function initMemberStatisticsByYear_chart(){
	var memberStatisticsByYear_chart_bar = echarts.init(document.getElementById("memberStatisticsByYear_chart_bar"));
	var memberStatisticsByYear_chart_pie = echarts.init(document.getElementById("memberStatisticsByYear_chart_pie"));
	// 过渡---------------------
	memberStatisticsByYear_chart_bar.showLoading({
	    text: '正在努力的读取数据中...',    //loading话术
	});
	memberStatisticsByYear_chart_pie.showLoading({
		text: '正在努力的读取数据中...',    //loading话术
	});

	memberStatisticsByYear_chart_bar.hideLoading();
	memberStatisticsByYear_chart_pie.hideLoading();
	// 图表使用-------------------
	var option1 = {
		title: {
			text:'年度注册用户数柱状图',
			x:'center'
		},
	    tooltip: {                                  // 气泡提示配置
	        trigger: 'item'                      // 触发类型，默认数据触发，可选为：'axis'
	    },
	    xAxis: [                                    // 直角坐标系中横轴数组
	        {
	            type: 'category',                   // 坐标轴类型，横轴默认为类目轴，数值轴则参考yAxis说明
	            data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
	        }
	    ],
	    yAxis: [                                    // 直角坐标系中纵轴数组
	        {
	            type: 'value',                      // 坐标轴类型，纵轴默认为数值轴，类目轴则参考xAxis说明
	            splitNumber: 4                      // 数值轴用，分割段数，默认为5
	        }
	    ],
	    series: [
	        {
	            name: '注册用户数',                    // 系列名称
	            type: 'bar',                       // 图表类型，折线图line、散点图scatter、柱状图bar、饼图pie、雷达图radar
	            data: [45, 123, 145, 526, 233, 343, 44, 829, 33, 123, 45, 13]
	        }
	    ]
	};
	var option2 = {
			title: {
				text:'年度注册用户数饼状图',
				x:'center'
			},
			tooltip: {                                  // 气泡提示配置
				trigger: 'item',                      // 触发类型，默认数据触发，可选为：'axis'
				formatter: "{a} <br/>{b} : {c} ({d}%)"
			},
			legend: {
		        orient : 'vertical',
		        x : 'left',
		        data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
		    },
		    series : [
		              {
		                  name:'注册用户数',
		                  type:'pie',
		                  radius : '55%',
		                  center: ['50%', '60%'],
		                  data:[
		                      {value:45, name:'1月'},
		                      {value:123, name:'2月'},
		                      {value:145, name:'3月'},
		                      {value:526, name:'4月'},
		                      {value:233, name:'5月'},
		                      {value:343, name:'6月'},
		                      {value:44, name:'7月'},
		                      {value:829, name:'8月'},
		                      {value:33, name:'9月'},
		                      {value:123, name:'10月'},
		                      {value:45, name:'11月'},
		                      {value:13, name:'12月'}
		                  ]
		              }
		          ]
	};
	memberStatisticsByYear_chart_bar.setOption(option1);
	memberStatisticsByYear_chart_pie.setOption(option2);

}
function initMemberStatisticsByMonth_chart(){
	var memberStatisticsByMonth_chart_bar = echarts.init(document.getElementById("memberStatisticsByMonth_chart_bar"));
	// 过渡---------------------
	memberStatisticsByMonth_chart_bar.showLoading({
	    text: '正在努力的读取数据中...',    //loading话术
	});

	memberStatisticsByMonth_chart_bar.hideLoading();
	// 图表使用-------------------
	var option1 = {
		title: {
			text:'月注册用户数柱状图',
			x:'center'
		},
	    tooltip: {                                  // 气泡提示配置
	        trigger: 'item'                      // 触发类型，默认数据触发，可选为：'axis'
	    },
	    xAxis: [                                    // 直角坐标系中横轴数组
	        {
	            type: 'category',                   // 坐标轴类型，横轴默认为类目轴，数值轴则参考yAxis说明
	            data: ['1日', '2日', '3日', '4日', '5日', '6日', '7日', '8日', '9日', '10日', '11日', '12日', '13日', '14日', '15日', '16日', 
	                   '17日', '18日', '19日', '20日', '21日', '22日', '23日', '24日', '25日', '26日', '27日', '28日', '29日', '30日', '31日']
	        }
	    ],
	    yAxis: [                                    // 直角坐标系中纵轴数组
	        {
	            type: 'value',                      // 坐标轴类型，纵轴默认为数值轴，类目轴则参考xAxis说明
	            splitNumber: 4                      // 数值轴用，分割段数，默认为5
	        }
	    ],
	    series: [
	        {
	            name: '注册用户数',                    // 系列名称
	            type: 'bar',                       // 图表类型，折线图line、散点图scatter、柱状图bar、饼图pie、雷达图radar
	            data: [45, 123, 145, 526, 233, 343, 44, 829, 33, 123, 45, 13,45, 123, 145, 526, 233, 343, 44, 829, 33, 123, 45, 13,45, 123, 145, 526, 233, 343, 44]
	        }
	    ]
	};
	memberStatisticsByMonth_chart_bar.setOption(option1);

}
function initMemberStatisticsByDay_chart(){
	var memberStatisticsByDay_chart_bar = echarts.init(document.getElementById("memberStatisticsByDay_chart_bar"));
	// 过渡---------------------
	memberStatisticsByDay_chart_bar.showLoading({
		text: '正在努力的读取数据中...',    //loading话术
	});
	
	memberStatisticsByDay_chart_bar.hideLoading();
	// 图表使用-------------------
	var option1 = {
			title: {
				text:'日注册用户数柱状图',
				x:'center'
			},
			tooltip: {                                  // 气泡提示配置
				trigger: 'item'                      // 触发类型，默认数据触发，可选为：'axis'
			},
			xAxis: [                                    // 直角坐标系中横轴数组
			                                            {
			                                            	type: 'category',                   // 坐标轴类型，横轴默认为类目轴，数值轴则参考yAxis说明
			                                            	data: ['0点-1点', '1点-2点', '2点-3点', '3点-4点', '4点-5点', '5点-6点', '6点-7点', '7点-8点', '8点-9点', '9点-10点', '10点-11点', '11点-12点', '12点-13点', '13点-14点', '14点-15点', '15点-16点', 
			                                            	       '16点-17点', '18点-19点', '19点-20点', '20点-21点', '21点-22点', '22点-23点', '23点-24点']
			                                            }
			                                            ],
			                                            yAxis: [                                    // 直角坐标系中纵轴数组
			                                                                                        {
			                                                                                        	type: 'value',                      // 坐标轴类型，纵轴默认为数值轴，类目轴则参考xAxis说明
			                                                                                        	splitNumber: 4                      // 数值轴用，分割段数，默认为5
			                                                                                        }
			                                                                                        ],
			                                                                                        series: [
			                                                                                                 {
			                                                                                                	 name: '注册用户数',                    // 系列名称
			                                                                                                	 type: 'bar',                       // 图表类型，折线图line、散点图scatter、柱状图bar、饼图pie、雷达图radar
			                                                                                                	 data: [45, 123, 145, 526, 233, 343, 44, 829, 33, 123, 45, 13,45, 123, 145, 526, 233, 343, 44, 829, 33, 123, 45, 13]
			                                                                                                 }
			                                                                                                 ]
	};
	memberStatisticsByDay_chart_bar.setOption(option1);
	
}
function initMemberStatisticsByWeek_chart(){
	var memberStatisticsByWeek_chart_bar = echarts.init(document.getElementById("memberStatisticsByWeek_chart_bar"));
	var memberStatisticsByWeek_chart_pie = echarts.init(document.getElementById("memberStatisticsByWeek_chart_pie"));
	// 过渡---------------------
	memberStatisticsByWeek_chart_bar.showLoading({
	    text: '正在努力的读取数据中...',    //loading话术
	});
	memberStatisticsByWeek_chart_pie.showLoading({
		text: '正在努力的读取数据中...',    //loading话术
	});

	memberStatisticsByWeek_chart_bar.hideLoading();
	memberStatisticsByWeek_chart_pie.hideLoading();
	// 图表使用-------------------
	var option1 = {
		title: {
			text:'周注册用户数柱状图',
			x:'center'
		},
	    tooltip: {                                  // 气泡提示配置
	        trigger: 'item'                      // 触发类型，默认数据触发，可选为：'axis'
	    },
	    xAxis: [                                    // 直角坐标系中横轴数组
	        {
	            type: 'category',                   // 坐标轴类型，横轴默认为类目轴，数值轴则参考yAxis说明
	            data: ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日']
	        }
	    ],
	    yAxis: [                                    // 直角坐标系中纵轴数组
	        {
	            type: 'value',                      // 坐标轴类型，纵轴默认为数值轴，类目轴则参考xAxis说明
	            splitNumber: 4                      // 数值轴用，分割段数，默认为5
	        }
	    ],
	    series: [
	        {
	            name: '注册用户数',                    // 系列名称
	            type: 'bar',                       // 图表类型，折线图line、散点图scatter、柱状图bar、饼图pie、雷达图radar
	            data: [45, 123, 145, 526, 233, 343, 44]
	        }
	    ]
	};
	var option2 = {
			title: {
				text:'年度注册用户数饼状图',
				x:'center'
			},
			tooltip: {                                  // 气泡提示配置
				trigger: 'item',                      // 触发类型，默认数据触发，可选为：'axis'
				formatter: "{a} <br/>{b} : {c} ({d}%)"
			},
			legend: {
		        orient : 'vertical',
		        x : 'left',
		        data: ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日']
		    },
		    series : [
		              {
		                  name:'注册用户数',
		                  type:'pie',
		                  radius : '55%',
		                  center: ['50%', '60%'],
		                  data:[
		                      {value:45, name:'星期一'},
		                      {value:123, name:'星期二'},
		                      {value:145, name:'星期三'},
		                      {value:526, name:'星期四'},
		                      {value:233, name:'星期五'},
		                      {value:343, name:'星期六'},
		                      {value:44, name:'星期日'}
		                  ]
		              }
		          ]
	};
	memberStatisticsByWeek_chart_bar.setOption(option1);
	memberStatisticsByWeek_chart_pie.setOption(option2);

}
function initTrafficStatistics_chart(){
	var trafficStatistics_chart_line = echarts.init(document.getElementById("trafficStatistics_chart_line"));
	// 过渡---------------------
	trafficStatistics_chart_line.showLoading({
	    text: '正在努力的读取数据中...',    //loading话术
	});

	trafficStatistics_chart_line.hideLoading();
	// 图表使用-------------------
	var option1 = {
		title: {
			text:'流量统计图'
		},
		legend: {
	        data:['PV','UV','IP']
	    },
	    tooltip: {                                  // 气泡提示配置
	        trigger: 'item'                      // 触发类型，默认数据触发，可选为：'axis'
	    },
	    xAxis: [                                    // 直角坐标系中横轴数组
	        {
	            type: 'category',                   // 坐标轴类型，横轴默认为类目轴，数值轴则参考yAxis说明
	            data: ['2014-09-26', '2014-09-25', '2014-09-24', '2014-09-23', '2014-09-22', '2014-09-21']
	        }
	    ],
	    yAxis: [                                    // 直角坐标系中纵轴数组
	        {
	            type: 'value',                      // 坐标轴类型，纵轴默认为数值轴，类目轴则参考xAxis说明
	            splitNumber: 4                      // 数值轴用，分割段数，默认为5
	        }
	    ],
	    series: [
	        {
	            name: 'PV',                    // 系列名称
	            type: 'line',                       // 图表类型，折线图line、散点图scatter、柱状图bar、饼图pie、雷达图radar
	            data: [45, 123, 145, 526, 233, 343]
	        },{
	            name: 'UV',                    // 系列名称
	            type: 'line',                       // 图表类型，折线图line、散点图scatter、柱状图bar、饼图pie、雷达图radar
	            data: [30, 100, 120, 480, 199, 288]
	        },{
	            name: 'IP',                    // 系列名称
	            type: 'line',                       // 图表类型，折线图line、散点图scatter、柱状图bar、饼图pie、雷达图radar
	            data: [25, 59, 100, 260, 150, 200]
	        }
	    ]
	};
	trafficStatistics_chart_line.setOption(option1);

}


function initChannelVisitStatistics_chart(){
	var channelVisitStatistics_chart_1 = echarts.init(document.getElementById("channelVisitStatistics_chart_1"));
	// 过渡---------------------
	channelVisitStatistics_chart_1.showLoading({
		text: '正在努力的读取数据中...',    //loading话术
	});

	channelVisitStatistics_chart_1.hideLoading();
	var option2 = {
			title: {
				text:'频道访问量TOP10饼状图',
				x:'center'
			},
			tooltip: {                                  // 气泡提示配置
				trigger: 'item',                      // 触发类型，默认数据触发，可选为：'axis'
				formatter: "{a} <br/>{b} : {c} ({d}%)"
			},
			legend: {
		        orient : 'vertical',
		        x : 'left',
		        data: ['新闻', '视频', '下载', '图库']
		    },
		    series : [
		              {
		                  name:'注册用户数',
		                  type:'pie',
		                  radius : '55%',
		                  center: ['50%', '60%'],
		                  data:[
		                      {value:45, name:'新闻'},
		                      {value:123, name:'视频'},
		                      {value:145, name:'下载'},
		                      {value:526, name:'图库'}
		                     
		                  ]
		              }
		          ]
	};
	channelVisitStatistics_chart_1.setOption(option2);

}



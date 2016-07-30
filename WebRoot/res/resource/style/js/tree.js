var cesgroupLineNodes =[
                   	{ name:"中信官网", open:true,
                   		children: [
                   			{ name:"新闻中心",open:true,
                   				children: [
                   					{ name:"公司动态(有审核)",action:"article/articleList.html?isAudit=1"}, 
                   					{ name:"资讯中心(无审核)",action:"article/articleList.html?isAudit=0"},
                   				    { name:"图片",action:"article/articleList-pics.html"},
                   				    { name:"视频",action:"article/articleList-video.html"},
                   				    { name:"音频",action:"article/articleList-video.html"}
                   				]},
                   			{ name:"关于中信",open:true,
                   				children: [ 
                   				    { name:"公司介绍",action:"article/articleList-pics.html"},
                   				    { name:"荣誉资质",action:"article/articleList-pics.html"},
                   				    { name:"社会责任",action:"article/articleList-pics.html"},
                   				    { name:"中信风采",action:"article/articleList-pics.html"},
                   				    { name:"企业VI",action:"article/articleList-pics.html"},
                   				    { name:"招贤纳士",action:"article/articleList-pics.html"}, 
                   				    { name:"联系我们",action:"article/articleList-pics.html"}
                   				]},
                   			{ name:"解决方案", open:true,
                   				children: [ 
                   				    { name:"档案局管",action:"article/articleList-vedio.html",
                   				    	children:[
                   				    	     {name:"数字档案馆整体解决方案",action:"article/articleList-vedio.html"},
                   				    	     {name:"实体档案馆智能化系统解决方案",action:"article/articleList-vedio.html"},
                   				    	     {name:"民生档案远程服务解决方案",action:"article/articleList-vedio.html"}
                   				    	]},
                   				    { name:"食品流通",action:"article/articleList-vedio.html",
                   				    	children:[
                        				     {name:"食品流通安全信息追溯解决方案",action:"article/articleList-vedio.html"},
                        				     {name:"食品流通追溯整体运营监管解决方案",action:"article/articleList-vedio.html"}
                        				]},
                   				    { name:"政法系统",action:"article/articleList-vedio.html",
                   				    	children:[
                        				     {name:"政务协同办公解决方案",action:"article/articleList-vedio.html"}
                        				]},
                   				    { name:"图书文博",action:"article/articleList-vedio.html",
                   				    	children:[
                        				     {name:"文博一体化解决方案",action:"article/articleList-vedio.html"}
                        				]},
                   				    { name:"企业集团",action:"article/articleList-vedio.html",
                   				    	children:[
                        				     {name:"数字档案室解决方案",action:"article/articleList-vedio.html"}
                        				]},
                   				    { name:"司法行政",action:"article/articleList-vedio.html",
                   				    	children:[
                        				     {name:"智慧社区矫正建设整体解决方案",action:"article/articleList-vedio.html"}
                        				]},
                   				    { name:"数据服务",action:"article/articleList-vedio.html",
                   				    	children:[
                        				     {name:"数字化加工解决方案",action:"article/articleList-vedio.html"},
                        				     {name:"病例电子化解决方案",action:"article/articleList-vedio.html"}
                        				]}
               				]},
               				{ name:"软件产品", open:true,
                   				children: [ 
                  				    { name:"云器",action:"article/articleList-vedio.html",
                   				    	children:[
                   				    	     { name:"云基系列构件类产品",action:"article/articleList-vedio.html"}
                   				    	]},
                   				    { name:"光典",action:"article/articleList-vedio.html",
                   				    	children:[
											{ name:"光典档案资源管理系统",action:"article/articleList-vedio.html"},
											{ name:"食品流通信息追溯管理系统",action:"article/articleList-vedio.html"},
											{ name:"S1 IT服务管理系统",action:"article/articleList-vedio.html"},
											{ name:"政务协同办公系统",action:"article/articleList-vedio.html"},
											{ name:"光搏博物馆智能化管理系统",action:"article/articleList-vedio.html"},
                        				]},
                   				    { name:"灵基",action:"article/articleList-vedio.html",
                   				    	children:[
                        				     {name:"灵器系列工具类产品",action:"article/articleList-vedio.html"}
                        				]}
               				]},
               				{ name:"服务支持"},
               				{ name:"典型用户",open:true,
                   				children: [ 
                   				    { name:"档案局管",action:"article/articleList-pics.html"},
                   				    { name:"食品流通追溯",action:"article/articleList-pics.html"},
                   				    { name:"政府机关公共事业",action:"article/articleList-pics.html"},
                   				    { name:"企业集团",action:"article/articleList-pics.html"}
                   				]},
                   		]}
                   ];
var cesoaLineNodes =[
                       	{ name:"中信OA", open:false,
                       		children: [
                       			{ name:"通知公告",open:true},
                       			{ name:"中信学院",open:true,
                       				children: [ 
                       				   { name:"课程安排",action:"article/articleList-pics.html"}, 
                       				   { name:"学院制度",action:"article/articleList-pics.html"}, 
                       				   { name:"成绩通报"}
                       				]},
                       			{ name:"工作指南", open:true,
                       				children: [ 
                       				   { name:"总裁办工作指南",action:"article/articleList-vedio.html"}, 
                       				   { name:"人力资源管理工作指南"}, 
                       				   { name:"财务管理工作指南"}, 
                       				   { name:"商务管理工作指南"}, 
                       				   { name:"行政管理工作指南"}, 
                       				   { name:"采购管理工作指南"},
                       				   { name:"IT工作指南"},
                       				   { name:"市场销售工作指南"},
                       				   { name:"技术研发工作指南"},
                       				   { name:"项目信息管理工作指南"},
                       				   { name:"S1服务管理工作指南"},
                       				   { name:"其他"}
                   				]},
                   				{ name:"招贤纳士",open:true,action:"article/articleList-download.html",
                   					children: [ 
                               				   { name:"招贤纳士",action:"article/articleList-vedio.html",
                               					   children: [ 
                                           				   { name:"外联专员",action:"article/articleList-pics.html"}, 
                                           				   { name:"项目经理(数字化加工)",action:"article/articleList-pics.html"},
                                           				   { name:"项目经理(集成)",action:"article/articleList-pics.html"},
                                           				   { name:"产品经理"}
                                           				] 
                               				   }, 
                               				   { name:"内部竞聘",
                               					   children: [ 
                                           				   { name:"战略发展总监(总裁办公室战略规划部)",action:"article/articleList-pics.html"}, 
                                           				   { name:"市场部部门经理(食品追溯事业部)",action:"article/articleList-pics.html"}
                                           				]    
                               				   }
                           				]
                   				},
                   				{ name:"有奖反馈",
                   					children: [ 
                               				   { name:"公司产品",action:"article/articleList-pics.html"}, 
                               				   { name:"ERP",action:"article/articleList-pics.html"}
                               				] 
                   				},
                   				{ name:"中信文化",
                   					children: [ 
                               				   { name:"企业的愿景",action:"article/articleList-pics.html"}, 
                               				   { name:"公司使命",action:"article/articleList-pics.html"},
                               				   { name:"宗旨",action:"article/articleList-pics.html"},
                               				   { name:"核心价值观",action:"article/articleList-pics.html"},
                               				   { name:"我们的文化",action:"article/articleList-pics.html"}
                               				]
                   				},
                   				{ name:"内审投诉",
                   					children: [ 
                               				   { name:"内审投诉登记",action:"article/articleList-pics.html"}, 
                               				   { name:"内审投诉反馈",action:"article/articleList-pics.html"}
                               				]
                   				},
                   				{ name:"文化节",
                   					children: [ 
                               				   { name:"文化节",action:"article/articleList-pics.html",
                               					   children: [ 
                                           				   { name:"发现CES的美",action:"article/articleList-pics.html"}, 
                                           				   { name:"你来我往",action:"article/articleList-pics.html"},
                                           				   { name:"欢乐三打一",action:"article/articleList-pics.html"},
                                           				   { name:"The Voice of CES",action:"article/articleList-pics.html"}, 
                                           				   { name:"旅游节",action:"article/articleList-pics.html"}, 
                                           				   { name:"我声我优",action:"article/articleList-pics.html"}, 
                                           				   { name:"献出你的爱",action:"article/articleList-pics.html"}, 
                                           				   { name:"源源不断",action:"article/articleList-pics.html"}, 
                                           				   { name:"万众齐心",action:"article/articleList-pics.html"}, 
                                           				   { name:"展现部门风采",action:"article/articleList-pics.html"}, 
                                           				   { name:"员工体检",action:"article/articleList-pics.html"}, 
                                           				   { name:"2014年年终大会",action:"article/articleList-pics.html"} 
                                           				]
                               				   }
                               				]
                   				}
                       		]}
                       ];
var fileNodes =[
             	{ name:"中信官网", action:"file/fileList.html",open:true,
             		children: [{
             			name:"jquery-cui",action:"file/fileList.html",open:true},
             			{name:"style",action:"file/fileList.html",open:true,
                 			children:[{ name:"css",open:true,
                 					children:[
                 					    {name:"index.css"},
                 					    {name:"body.css"},
                 					    {name:"common.css"}
                 					  ]},
                 			       	  { name:"images"},
                 			    	  { name:"js"}
                 				]}
             		]}
             ];

var orgNodes =[
              	{ name:"组织机构", action:ctx+"/backstage/system/org",open:true,
              		children: [{
              			name:"研发中心",action:ctx+"/backstage/system/org",open:true,
              			children:[{ name:"研发一部"},
              			       	  { name:"研发二部"},
              			    	  { name:"研发三部",isParent:true}
              				]}
              		]}
              ];
var userNodes =[
             	{ name:"组织机构", action:"setting/user.html",open:true,
             		children: [{
             			name:"研发中心",action:"setting/user.html",open:true,
             			children:[{ name:"研发一部"},
             			       	  { name:"研发二部"},
             			    	  { name:"研发三部"}
             				]}
             		]}
             ];
var userLineNodes = [
			{ name:"组织机构",open:true,
					children: [{
						name:"研发中心",open:true,
						children:[{ name:"研发一部",open:true,
							children:[{name:"陆志超"},{name:"王雷2"},{name:"邱初烧"},{name:"甘名辉"}
							          ]
						},
						       	  { name:"研发二部",open:true,
							children:[{name:"王链伟"},{name:"陈军志"},{name:"孙传金"},{name:"陆开奇"}
					          ]
						       	  },
						    	  { name:"研发三部"}
							]}
					]}
                     ];
var cesgroupChannelLineNodes =[
                       	{ name:"中信官网", open:false,action:"channel/channelList.html",
                       		children: [
                       			{ name:"新闻中心",open:false,action:"channel/channelList.html",
                       				children: [
                       					{ name:"公司动态"}, 
                       					{ name:"资讯中心"}
                       				]},
                       			{ name:"关于中信",open:false,
                       				children: [ 
                       				    { name:"公司介绍"},
                       				    { name:"荣誉资质"},
                       				    { name:"社会责任"},
                       				    { name:"中信风采"},
                       				    { name:"企业VI"},
                       				    { name:"招贤纳士"}, 
                       				    { name:"联系我们"}
                       				]},
                       			{ name:"解决方案", open:false,
                       				children: [ 
                       				    { name:"档案局管",
                       				    	children:[
                       				    	     {name:"数字档案馆整体解决方案"},
                       				    	     {name:"实体档案馆智能化系统解决方案"},
                       				    	     {name:"民生档案远程服务解决方案"}
                       				    	]},
                       				    { name:"食品流通",
                       				    	children:[
                            				     {name:"食品流通安全信息追溯解决方案"},
                            				     {name:"食品流通追溯整体运营监管解决方案"}
                            				]},
                       				    { name:"政法系统",
                       				    	children:[
                            				     {name:"政务协同办公解决方案"}
                            				]},
                       				    { name:"图书文博",
                       				    	children:[
                            				     {name:"文博一体化解决方案"}
                            				]},
                       				    { name:"企业集团",
                       				    	children:[
                            				     {name:"数字档案室解决方案"}
                            				]},
                       				    { name:"司法行政",
                       				    	children:[
                            				     {name:"智慧社区矫正建设整体解决方案"}
                            				]},
                       				    { name:"数据服务",
                       				    	children:[
                            				     {name:"数字化加工解决方案"},
                            				     {name:"病例电子化解决方案"}
                            				]}
                   				]},
                   				{ name:"软件产品", open:false,
                       				children: [ 
                      				    { name:"云器",
                       				    	children:[
                       				    	     { name:"云基系列构件类产品"}
                       				    	]},
                       				    { name:"光典",
                       				    	children:[
    											{ name:"光典档案资源管理系统"},
    											{ name:"食品流通信息追溯管理系统"},
    											{ name:"S1 IT服务管理系统"},
    											{ name:"政务协同办公系统"},
    											{ name:"光搏博物馆智能化管理系统"},
                            				]},
                       				    { name:"灵基",
                       				    	children:[
                            				     {name:"灵器系列工具类产品"}
                            				]}
                   				]},
                   				{ name:"服务支持"},
                   				{ name:"典型用户",open:true,
                       				children: [ 
                       				    { name:"档案局管"},
                       				    { name:"食品流通追溯"},
                       				    { name:"政府机关公共事业"},
                       				    { name:"企业集团"}
                       				]},
                       		]}
                       ];
var cesoaChannelLineNodes =[
                    	{ name:"中信OA", open:false,action:"site/channelList.html",
                    		children: [
                    			{ name:"通知公告",open:false,action:"site/channelList.html"},
                    			{ name:"中信学院",open:false,
                    				children: [ 
                    				   { name:"课程安排"}, 
                    				   { name:"学院制度"}, 
                    				   { name:"成绩通报"}
                    				]},
                    			{ name:"工作指南", open:false,
                    				children: [ 
                    				   { name:"总裁办工作指南"}, 
                    				   { name:"人力资源管理工作指南"}, 
                    				   { name:"财务管理工作指南"}, 
                    				   { name:"商务管理工作指南"}, 
                    				   { name:"行政管理工作指南"}, 
                    				   { name:"采购管理工作指南"},
                    				   { name:"IT工作指南"},
                    				   { name:"市场销售工作指南"},
                    				   { name:"技术研发工作指南"},
                    				   { name:"项目信息管理工作指南"},
                    				   { name:"S1服务管理工作指南"},
                    				   { name:"其他"}
                				]},
                				{ name:"招贤纳士",open:false,
                					children: [ 
                            				   { name:"招贤纳士",
                            					   children: [ 
                                        				   { name:"外联专员"}, 
                                        				   { name:"项目经理(数字化加工)"},
                                        				   { name:"项目经理(集成)"},
                                        				   { name:"产品经理"}
                                        				] 
                            				   }, 
                            				   { name:"内部竞聘",
                            					   children: [ 
                                        				   { name:"战略发展总监(总裁办公室战略规划部)"}, 
                                        				   { name:"市场部部门经理(食品追溯事业部)"}
                                        				]    
                            				   }
                        				]
                				},
                				{ name:"有奖反馈",
                					children: [ 
                            				   { name:"公司产品"}, 
                            				   { name:"ERP"}
                            				] 
                				},
                				{ name:"中信文化",
                					children: [ 
                            				   { name:"企业的愿景"}, 
                            				   { name:"公司使命"},
                            				   { name:"宗旨"},
                            				   { name:"核心价值观"},
                            				   { name:"我们的文化"}
                            				]
                				},
                				{ name:"内审投诉",
                					children: [ 
                            				   { name:"内审投诉登记"}, 
                            				   { name:"内审投诉反馈"}
                            				]
                				},
                				{ name:"文化节",
                					children: [ 
                            				   { name:"文化节",
                            					   children: [ 
                                        				   { name:"发现CES的美"}, 
                                        				   { name:"你来我往"},
                                        				   { name:"欢乐三打一"},
                                        				   { name:"The Voice of CES"}, 
                                        				   { name:"旅游节"}, 
                                        				   { name:"我声我优"}, 
                                        				   { name:"献出你的爱"}, 
                                        				   { name:"源源不断"}, 
                                        				   { name:"万众齐心"}, 
                                        				   { name:"展现部门风采"}, 
                                        				   { name:"员工体检"}, 
                                        				   { name:"2014年年终大会"} 
                                        				]
                            				   }
                            				]
                				}
                    		]}
                    ];

var templateNodes =[
              	{ name:"temeplate",open:true,
              		children: [{
              			name:"default",open:true,action:"template/templateList.html",
              			children:[{ name:"alone",open:true,action:"template/templateList.html",
									children: [{ name:"单页.html",action:"template/page.html"}
											]},
								  {name:"channel",action:"template/templateList.html",
									children:[{ name:"新闻栏目.html",action:"template/page.html"}]},
								  {name:"comment",action:"template/templateList.html",
									children:[{ name:"查看评论回复.html",action:"template/page.html"},
									          { name:"评论管理.html",action:"template/page.html"},
									          { name:"我的评论列表.html",action:"template/page.html"}
									          ]},
						          {name:"content",action:"template/templateList.html",
										children:[{ name:"新闻内容.html",action:"template/page.html"}
										          ]}
              				]}
              		]}
              ];
var setting = {
		onclick:function(e, treeId, treeNode){
			   if(treeNode.action){
				   var panel = $("#coralui-layout").layout("panel","center");
					panel.panel("refresh", treeNode.action);
			   }
		}
	};

var roleResNodes =[
                  	{ name:"资源树",open:true,
                  		children:[{ name:"内容管理",open:true,
                  			children: [{ name:"文章管理"}, 
                  			           { name:"专题管理"}, 
                  			           { name:"期刊管理"}
                  			           ]},
                  			{ name:"建站管理",open:true,
	              			children: [{ name:"站点管理"}, 
	              			           { name:"频道管理"}, 
	              			           { name:"模型管理"},
	              			           { name:"模板管理"},
	              			           { name:"文件管理"},
	              			           { name:"工作流管理"}
	              			           ]}                                                
	              			]}
                  ];
var resNodes =[
                   { name:"资源树",open:true,action:'setting/resource.html',
                	   children:[{ name:"内容管理",open:true,
                		   children: [{ name:"文章管理"}, 
                		              { name:"专题管理"}, 
                		              { name:"期刊管理"}
                		              ]},
                		              { name:"建站管理",open:true,
                		            	  children: [{ name:"站点管理"}, 
                		            	             { name:"频道管理"}, 
                		            	             { name:"模型管理"},
                		            	             { name:"模板管理"},
                		            	             { name:"文件管理"},
                		            	             { name:"工作流管理"}
                		            	             ]}                                                
                		              ]}
                   ];
var roleResSetting={
		checkable:true,
		chkStyle: "checkbox"
};
var userLineNodesSetting={
		checkable:true,
		chkStyle: "checkbox"
};
var publisTree =[
               	{ name:"中信网站", open:true,
               		children: [
               			{ name:"新闻",
               				children: [
               					{ name:"国内新闻",action:"article/articleList.html"}, { name:"国际新闻",action:"article/articleList.html"}, { name:"社会热点",action:"article/articleList.html"},{ name:"时事评论",action:"article/articleList.html"}
               				]},
               			{ name:"图库",
               				children: [ { name:"文娱体育"}, { name:"美容资讯"}, { name:"文化校园"}
               				]},
               			{ name:"视频", children: [ { name:"电视剧"}, { name:"记录片"}, { name:"电影"}
           				]},
           				{ name:"关于我们"},
           				{ name:"联系我们"}
               		]}
               ];
var publisTreeSetting={
		checkable:true,
		chkStyle: "checkbox"
};
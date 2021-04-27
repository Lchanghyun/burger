					const eachbranchData = {
							labels:labels,
							datasets:[{
								data:datas,
								backgroundColor: backColor
							}]
						};
						let chart  = new Chart(totalChart,{
							type: 'bar',
							data: eachbranchData,
							options:{
								responsive: false,
								legend:{
									display:false
								},
								scales:{
									xAxes:[{
										ticks:{
											fontSize:16,
											fontFamily: "GmarketSansMedium"
										}
									}],
									yAxes: [{
										afterFit: function(scaleInstance){
											scaleInstance.width = 80;
										},
										ticks:{
											beginAtZero: true,
											fontFamily: "GmarketSansMedium",
											stepSize:100000,
											max:1000000,
											callback: function(label, index, labels){
												return Intl.NumberFormat().format(label);
											}
										}
									}]
								}
							}
						});
					
					$(function(){
						$("option").each(function(index, ele){
							if($(this).val() === '${nowyear}'){
								$(this).prop("selected",true);
							}
							if($(this).val() === '${nowmonth}'){
								$(this).prop("selected",true);
							}
						});
						$(".SelectBtn1").click(function(){
							let selectYear = $("select[name=year]").val();
							let selectMonth = $("select[name=month]").val();
							$.ajax({
								url: "monthtotalbranchChart",
								type: "POST",
								data: {
									year: selectYear,
									month: selectMonth
								},
								success: function(res){
									console.log(res);
									$("#mySuperChart1").children().remove();
									let table = 
									'<table class="ChartTable">'+
										'<thead>'+
											'<tr>'+
												'<th width="20%">지점</th>'+
												'<th width="20%">'+res.prevyear+'/'+res.prevmonth+'</th>'+
												'<th width="20%">'+res.nowyear+'/'+res.nowmonth+'</th>'+
												'<th width="40%">전월대비</th>'+
											'</tr>'+
										'</thead>'+
										'<tbody id="contentInsert">'+
										'</tbody>'+
									'</table>';
									$("#mySuperChart1").append(table);
									let content1 = "";
									let content2 = "";
									let join = "";
									backColor = [];
									labels = [];
									datas = [];
									for(let i=0; i<res.length; i++){
											backColor.push('#EE4E34');
											labels.push(res.totalchartList[i].branch_name);
											datas.push(res.totalchartList[i].total);
											let incre = res.totalchartList[i].total - res.prevList[i].total;
											let prevTotal = res.prevList[i].total;
										content1 = 
											'<tr>'+
											'<td>'+res.totalchartList[i].branch_name+'</td>'+
											'<td>'+prevTotal.toLocaleString('en-US')+'</td>'+
											'<td>'+res.totalchartList[i].total.toLocaleString('en-US')+'</td>';
											if(incre > 0){
												if(prevTotal != 0){
													content2 =
														'<td class="statusRed">▲ '+incre.toLocaleString('en-US')+' (+'+((incre/prevTotal)*100).toFixed(2)+'%)</td></tr>';
												}
												else{
													content2 = '<td class="statusRed">▲ '+incre.toLocaleString('en-US')+' (+∞%)</td></tr>';
												}
											}
											else if(incre < 0){
												if(prevTotal != 0){
													content2 =
														'<td class="statusBlue">▼ '+incre.toLocaleString('en-US')+' ('+((incre/prevTotal)*100).toFixed(2)+'%)</td></tr>';
												}
												else{
													content2 = '<td class="statusBlue">▼ '+incre.toLocaleString('en-US')+' (-∞%)</td></tr>';
												}
											}
											else{
												content2 = '<td  class="statusZero">-</td></tr>';
											}
										join = content1 + content2;
										$("#contentInsert").append(join);
									};
									
									const eachbranchData = {
										labels:labels,
										datasets:[{
											data:datas,
											backgroundColor: backColor
										}]
									};
									let chart  = new Chart(totalChart,{
										type: 'bar',
										data: eachbranchData,
										options:{
											responsive: false,
											legend:{
												display:false
											},
											scales:{
												xAxes:[{
													ticks:{
														fontSize:16,
														fontFamily: "GmarketSansMedium"
													}
												}],
												yAxes: [{
													afterFit: function(scaleInstance){
														scaleInstance.width = 80;
													},
													ticks:{
														beginAtZero: true,
														fontFamily: "GmarketSansMedium",
														stepSize:100000,
														max:1000000,
														callback: function(label, index, labels){
															return Intl.NumberFormat().format(label);
														}
													}
												}]
											}
										}
									});
								}
							});
						});
					})
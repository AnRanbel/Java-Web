package com.wy.web;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wy.user.ProductInfo;

import javax.servlet.http.HttpServletRequest;

public class GetProductInfoPost {

//全部/分类查看
public List<ProductInfo> GetProductInfo(String flag,String index,String page,HttpServletRequest request,String sort){
		
		List<ProductInfo> infolist=new ArrayList<ProductInfo>();
		ManageMySQL8 conn=new ManageMySQL8();
		String sql=null;
		ResultSet rs=null;
		List<String> searchlist=new ArrayList<String>();
		searchlist.add("0");
		int pa=Integer.parseInt(page);      //当前分页
        String elements="";
		//System.out.println(sql);
		
		//全部查看
		if(flag.equals("ALL")){
            //分页功能——elements
            sql="select count(*) as elements from product_info";
            rs=conn.executeQuery(sql,null);
            try{
                while(rs.next()){
                    elements=rs.getString("elements");
                }
                request.setAttribute("elements",elements);
            }catch (SQLException e){
                e.printStackTrace();
            }

            if(sort==null){
                sql="select * from product_info limit "+(pa-1)*16+','+16;
            }else{
                sql="select * from product_info order by new_price "+sort+" limit "+(pa-1)*16+','+16;
            }
			rs=conn.executeQuery(sql,null);
		}else{      //分类查看
			/*String[] flag_re=flag.split("-");*/

			//CATEGORIES /BRANDS /PRICE
			if(flag.equals("Volleyball")||flag.equals("Volleyball Court")||flag.equals("Sport Shoes")||flag.equals("Sport Suit")||flag.equals("Categories_Other")){
				if(sort==null){
                    sql="select * from product_info where product_type=? limit "+(pa-1)*16+','+16;
                }else{
                    sql="select * from product_info where product_type=? order by new_price "+sort+" limit "+(pa-1)*16+','+16;
                }
				searchlist.set(0, index);
				rs=conn.executeQuery(sql,searchlist);
			}else if(flag.equals("Mikasa")||flag.equals("ASICS")||flag.equals("NIKE")||flag.equals("Adidas")||flag.equals("Li-Ning")||flag.equals("ANTA")||flag.equals("XTEP")||flag.equals("Brands_Other")){
				if(sort==null){
                    sql="select * from product_info where product_brand=? limit "+(pa-1)*16+','+16;
                }else{
                    sql="select * from product_info where product_brand=? order by new_price "+sort+" limit "+(pa-1)*16+','+16;
                }
				searchlist.set(0, index);
				rs=conn.executeQuery(sql,searchlist);
			}else if(flag.equals("0$-200$")||flag.equals("200$-400$")||flag.equals("400$-600$")||flag.equals("600$-800$")||flag.equals("800$-1000$")||flag.equals("1000以上")){
				int price=Integer.valueOf(index);
				switch(price){
				case 1:
				    if(sort==null){
                        sql="select * from product_info where new_price<200 and new_price>=0 limit "+(pa-1)*16+','+16;
                    }else{
                        sql="select * from product_info where new_price<200 and new_price>=0 order by new_price "+sort+" limit "+(pa-1)*16+','+16;
                    }
					break;
				case 2:
				    if(sort==null){
                        sql="select * from product_info where new_price>=200 and new_price<400 limit "+(pa-1)*16+','+16;
                    }else{
                        sql="select * from product_info where new_price>=200 and new_price<400 order by new_price "+sort+" limit "+(pa-1)*16+','+16;
                    }
					break;
				case 3:
				    if(sort==null){
                        sql="select * from product_info where new_price>=400 and new_price<600 limit "+(pa-1)*16+','+16;
                    }else{
                        sql="select * from product_info where new_price>=400 and new_price<600 order by new_price "+sort+" limit "+(pa-1)*16+','+16;
                    }
					break;
				case 4:
				    if(sort==null){
                        sql="select * from product_info where new_price>=600 and new_price<800 limit "+(pa-1)*16+','+16;
                    }else{
                        sql="select * from product_info where new_price>=600 and new_price<800 order by new_price "+sort+" limit "+(pa-1)*16+','+16;
                    }
					break;
				case 5:
				    if(sort==null){
                        sql="select * from product_info where new_price>=800 and new_price<1000 limit "+(pa-1)*16+','+16;
                    }else{
                        sql="select * from product_info where new_price>=800 and new_price<1000 order by new_price "+sort+" limit "+(pa-1)*16+','+16;
                    }
					break;
				default:
				    if(sort==null){
                        sql="select * from product_info where new_price>=1000 limit "+(pa-1)*16+','+16;
                    }else{
                        sql="select * from product_info where new_price>=1000 order by new_price "+sort+" limit "+(pa-1)*16+','+16;
                    }
					break;
				}
				rs=conn.executeQuery(sql,null);
			}
		}
		try{
			while(rs.next()){
				ProductInfo info=new ProductInfo();
				//通过索引或列名获得结果集中某列的值
				info.setId(rs.getString("id"));
				info.setProduct_type(rs.getString("product_type"));
				info.setProduct_brand(rs.getString("product_brand"));
				info.setProduct_name(rs.getString("product_name"));
				info.setOld_price(rs.getString("old_price"));
				info.setNew_price(rs.getString("new_price"));
				info.setProduct_info(rs.getString("product_info"));
				info.setProduct_img(rs.getString("product_img"));
				
				infolist.add(info);
			}
			return infolist;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			conn.close();
		}
	}

//全部/分类搜索
public List<ProductInfo> GetProductInfo(String flag, String index, String search, String page, HttpServletRequest request,String sort){
	
	List<ProductInfo> infolist=new ArrayList<ProductInfo>();
	ManageMySQL8 conn=new ManageMySQL8();
	String sql=null;
	ResultSet rs=null;
	List<String> searchlist=new ArrayList<String>();
	searchlist.add("0");
    int pa=Integer.parseInt(page);  //当前分页
    String elements="";
	//System.out.println(sql);
	
	//全部搜索
	if(flag.equals("ALL")){
        //分页功能——elements
        sql="select count(*) as elements from product_info where product_info like '%"+search+"%'";
        rs=conn.executeQuery(sql,null);
        try{
            while(rs.next()){
                elements=rs.getString("elements");
            }
            request.setAttribute("elements",elements);
        }catch (SQLException e){
            e.printStackTrace();
        }

        if(sort==null){
            sql="select * from product_info where product_info like '%"+search+"%' limit "+(pa-1)*16+','+16;
        }else{
            sql="select * from product_info where product_info like '%"+search+"%' order by new_price "+sort+" limit "+(pa-1)*16+','+16;
        }
		rs=conn.executeQuery(sql,null);
	}else{      //分类搜索
		/*String[] flag_re=flag.split("-");*/

		//CATEGORIES /BRANDS /PRICE
		if(flag.equals("Volleyball")||flag.equals("Volleyball Court")||flag.equals("Sport Shoes")||flag.equals("Sport Suit")||flag.equals("Categories_Other")){
            //分页功能——elements
            sql="select count(*) as elements from product_info where product_type=? and product_info like '%"+search+"%'";
            searchlist.set(0, index);
            rs=conn.executeQuery(sql,searchlist);
            try{
                while(rs.next()){
                    elements=rs.getString("elements");
                }
                request.setAttribute("elements",elements);
            }catch (SQLException e){
                e.printStackTrace();
            }

            if(sort==null){
                sql="select * from product_info where product_type=? and product_info like '%"+search+"%' limit "+(pa-1)*16+','+16;
            }else{
                sql="select * from product_info where product_type=? and product_info like '%"+search+"%' order by new_price "+sort+" limit "+(pa-1)*16+','+16;
            }
			searchlist.set(0, index);
			rs=conn.executeQuery(sql,searchlist);
		}else if(flag.equals("Mikasa")||flag.equals("ASICS")||flag.equals("NIKE")||flag.equals("Adidas")||flag.equals("Li-Ning")||flag.equals("ANTA")||flag.equals("XTEP")||flag.equals("Brands_Other")){
            //分页功能——elements
            sql="select count(*) as elements from product_info where product_brand=? and product_info like '%"+search+"%'";
            searchlist.set(0, index);
            rs=conn.executeQuery(sql,searchlist);
            try{
                while(rs.next()){
                    elements=rs.getString("elements");
                }
                request.setAttribute("elements",elements);
            }catch (SQLException e){
                e.printStackTrace();
            }

            if(sort==null){
                sql="select * from product_info where product_brand=? and product_info like '%"+search+"%' limit "+(pa-1)*16+','+16;
            }else{
                sql="select * from product_info where product_brand=? and product_info like '%"+search+"%' order by new_price "+sort+" limit "+(pa-1)*16+','+16;
            }
			searchlist.set(0, index);
			rs=conn.executeQuery(sql,searchlist);
		}else if(flag.equals("0$-200$")||flag.equals("200$-400$")||flag.equals("400$-600$")||flag.equals("600$-800$")||flag.equals("800$-100$")||flag.equals("1000以上")){
			int price=Integer.valueOf(index);
			switch(price){
			case 1:
                //分页功能——elements
                sql="select count(*) as elements from product_info where new_price<200 and new_price>=0 and product_info like '%"+search+"%'";
                rs=conn.executeQuery(sql,null);
                try{
                    while(rs.next()){
                        elements=rs.getString("elements");
                    }
                    request.setAttribute("elements",elements);
                }catch (SQLException e){
                    e.printStackTrace();
                }

                if(sort==null){
                    sql="select * from product_info where new_price<200 and new_price>=0 and product_info like '%"+search+"%' limit "+(pa-1)*16+','+16;
                }else{
                    sql="select * from product_info where new_price<200 and new_price>=0 and product_info like '%"+search+"%' order by new_price "+sort+" limit "+(pa-1)*16+','+16;
                }
				break;
			case 2:
                //分页功能——elements
                sql="select count(*) as elements from product_info where new_price>=200 and new_price<400 and product_info like '%"+search+"%'";
                rs=conn.executeQuery(sql,null);
                try{
                    while(rs.next()){
                        elements=rs.getString("elements");
                    }
                    request.setAttribute("elements",elements);
                }catch (SQLException e){
                    e.printStackTrace();
                }

                if(sort==null){
                    sql="select * from product_info where new_price>=200 and new_price<400 and product_info like '%"+search+"%' limit "+(pa-1)*16+','+16;
                }else{
                    sql="select * from product_info where new_price>=200 and new_price<400 and product_info like '%"+search+"%' order by new_price "+sort+" limit "+(pa-1)*16+','+16;
                }
				break;
			case 3:
                //分页功能——elements
                sql="select count(*) as elements from product_info where new_price>=400 and new_price<600 and product_info like '%"+search+"%'";
                rs=conn.executeQuery(sql,null);
                try{
                    while(rs.next()){
                        elements=rs.getString("elements");
                    }
                    request.setAttribute("elements",elements);
                }catch (SQLException e){
                    e.printStackTrace();
                }

                if(sort==null){
                    sql="select * from product_info where new_price>=400 and new_price<600 and product_info like '%"+search+"%' limit "+(pa-1)*16+','+16;
                }else{
                    sql="select * from product_info where new_price>=400 and new_price<600 and product_info like '%"+search+"%' order by new_price "+sort+" limit "+(pa-1)*16+','+16;
                }
				break;
			case 4:
                //分页功能——elements
                sql="select count(*) as elements from product_info where new_price>=600 and new_price<800 and product_info like '%"+search+"%'";
                rs=conn.executeQuery(sql,null);
                try{
                    while(rs.next()){
                        elements=rs.getString("elements");
                    }
                    request.setAttribute("elements",elements);
                }catch (SQLException e){
                    e.printStackTrace();
                }

                if(sort==null){
                    sql="select * from product_info where new_price>=600 and new_price<800 and product_info like '%"+search+"%' limit "+(pa-1)*16+','+16;
                }else{
                    sql="select * from product_info where new_price>=600 and new_price<800 and product_info like '%"+search+"%' order by new_price "+sort+" limit "+(pa-1)*16+','+16;
                }
				break;
			case 5:
                //分页功能——elements
                sql="select count(*) as elements from product_info where new_price>=800 and new_price<1000 and product_info like '%"+search+"%'";
                rs=conn.executeQuery(sql,null);
                try{
                    while(rs.next()){
                        elements=rs.getString("elements");
                    }
                    request.setAttribute("elements",elements);
                }catch (SQLException e){
                    e.printStackTrace();
                }

                if(sort==null){
                    sql="select * from product_info where new_price>=800 and new_price<1000 and product_info like '%"+search+"%' limit "+(pa-1)*16+','+16;
                }else{
                    sql="select * from product_info where new_price>=800 and new_price<1000 and product_info like '%"+search+"%' order by new_price "+sort+" limit "+(pa-1)*16+','+16;
                }
				break;
			default:
                //分页功能——elements
                sql="select count(*) as elements from product_info where new_price>=1000 and product_info like '%"+search+"%'";
                rs=conn.executeQuery(sql,null);
                try{
                    while(rs.next()){
                        elements=rs.getString("elements");
                    }
                    request.setAttribute("elements",elements);
                }catch (SQLException e){
                    e.printStackTrace();
                }

                if(sort==null){
                    sql="select * from product_info where new_price>=1000 and product_info like '%"+search+"%' limit "+(pa-1)*16+','+16;
                }else{
                    sql="select * from product_info where new_price>=1000 and product_info like '%"+search+"%' order by new_price "+sort+" limit "+(pa-1)*16+','+16;
                }
				break;
			}
			rs=conn.executeQuery(sql,null);
		}
	}
	try{
		while(rs.next()){
			ProductInfo info=new ProductInfo();
			//通过索引或列名获得结果集中某列的值
			info.setId(rs.getString("id"));
			info.setProduct_type(rs.getString("product_type"));
			info.setProduct_brand(rs.getString("product_brand"));
			info.setProduct_name(rs.getString("product_name"));
			info.setOld_price(rs.getString("old_price"));
			info.setNew_price(rs.getString("new_price"));
			info.setProduct_info(rs.getString("product_info"));
			info.setProduct_img(rs.getString("product_img"));
			
			infolist.add(info);
		}
		return infolist;
	}catch(Exception e){
		e.printStackTrace();
		return null;
	}finally{
		conn.close();
	}
}
}

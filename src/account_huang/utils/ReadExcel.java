package account_huang.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Component
public class ReadExcel{
    protected static Logger logger = Logger.getLogger("ReadExcel");
   

    private HSSFWorkbook hssfWorkbook;
    private XSSFWorkbook xssfWorkbook;
    
    public void setDownloadResponse(List<List<String>> matrix,HttpServletResponse response,String fileName){
  	  try {
            response.reset();
            response.setHeader("Content-Type","application/force-download");
            response.setHeader("Content-Type","application/vnd.ms-excel");
            response.setHeader("Content-disposition", "attachment; filename=" +fileName+".xls");// 设定输出文件头
            exportExcelWithList(matrix,response.getOutputStream());
        } catch (IOException e) {
        	System.out.println(e.getMessage());
        }
  }

    public void exportExcelWithList(List<List<String>> matrix, OutputStream os) {
        HSSFWorkbook wb = new HSSFWorkbook();
        Sheet sheet = wb.createSheet();
        //matrix.size() 表示源数据有多少行
        for (int i = 0; i < matrix.size(); i++) {
            List<String> data = matrix.get(i);
            Row rowData = sheet.createRow(i);
            for (int j = 0; j < data.size(); j++) {
                String value = data.get(j);
                Cell cell = rowData.createCell(j);
                if(StringUtils.isEmpty(value)||"null".equals(value)){
                	 cell.setCellValue("");
                }else{
                	 cell.setCellValue(value);
                }
               
            }
        }
        try {
            wb.write(os);
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            wb.close();
        } catch (IOException e) {
            e.printStackTrace();

        }
    }
    

 }
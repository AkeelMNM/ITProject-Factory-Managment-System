package fms.Inventory.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;

import com.fms.model.PerformanceTracking;
import com.fms.model.TeaStock;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;
import com.sun.prism.shader.Solid_LinearGradient_PAD_AlphaTest_Loader;

public class StockReportGeneratingService {
	
	
	public void generateTeaStockReportMonth(ArrayList<TeaStock> TeaList,String month) throws DocumentException, IOException {
		
		String fileName = "F:\\P\\Stock_Report.pdf"; //PDF file saving location
		Document document = new Document();
		document.setPageSize(PageSize.A2);  //PDF file size
		
		try {
			PdfWriter.getInstance(document, new FileOutputStream(fileName));  //PDF file Creating
			document.open(); //Opening the PDF file
			
			
/** ######################################################################################################################################### **/

		    
/**----------------------------------------------- Header Table -----------------------------------------------------------      **/
			
		    PdfPTable tableT = new PdfPTable(9); // 9 columns.
	        tableT.setWidthPercentage(100); //Width 100%
	        tableT.setSpacingBefore(10f); //Space before table
	        tableT.setSpacingAfter(10f); //Space after table
	        
	        //Set Column widths
	        float[] columnWidthsT = {1.5f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f};
	        tableT.setWidths(columnWidthsT);
	        
	        PdfPCell cell = new PdfPCell(); //Creating new Cell
	        cell.setBorder(Rectangle.NO_BORDER);
	        //Add Image
	        Image image1 = Image.getInstance("F:\\Pro files\\MainLogo.jpeg");
	        cell.addElement(image1);
	        tableT.addCell(cell);

	        float fntSize = 25f;
	        cell = new PdfPCell();
	        cell.addElement(new Phrase(20f,"Dehiwatta Tea Factory",FontFactory.getFont(FontFactory.TIMES_ROMAN, fntSize,Font.BOLD)));
	        cell.addElement(new Phrase(15f,"\nAddress : Hapugahayatatenna,Handessa"));
	        cell.addElement(new Phrase(10f,"\nTel : 0815630035"));
	        cell.addElement(new Phrase(10f,"\nEmail : nmmbrosdtf@gmail.com"));
	        cell.setPaddingLeft(10);
	        cell.setColspan(5);
	        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cell.setBorder(Rectangle.NO_BORDER);
	        tableT.addCell(cell);
	        
	        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");  
	        Date date = new Date();
	        
	        cell = new PdfPCell(new Paragraph("Date:"+formatter.format(date)));
	        cell.setRowspan(4);
	        cell.setColspan(3);
	        cell.setPaddingLeft(10);
	        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        cell.setBorder(Rectangle.NO_BORDER);
	        tableT.addCell(cell);
	        
	        document.add(tableT);
	        
	        LineSeparator ls = new LineSeparator();
	        document.add(new Chunk(ls));
	        
	        PdfPTable tableST = new PdfPTable(9); // 9 columns.
	        tableST.setWidthPercentage(100); //Width 100%
	        tableST.setSpacingBefore(10f); //Space before table
	        tableST.setSpacingAfter(10f); //Space after table
	        
	        //Set Column widths
	        float[] columnWidthsST = {1.5f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f};
	        tableST.setWidths(columnWidthsST);
	        
	        PdfPCell cellS = new PdfPCell();
	        cellS = new PdfPCell(new Paragraph(new Phrase(0f,"TEA STOCK REPORT")));
	        cellS.setColspan(5);
	        cellS.setPaddingBottom(8);
	        cellS.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cellS.setHorizontalAlignment(Element.ALIGN_LEFT);
	        cellS.setBorder(Rectangle.NO_BORDER);
	        tableST.addCell(cellS);
	        
	        cellS = new PdfPCell(new Paragraph("Month :"+month));
	        cellS.setColspan(6);
	        cellS.setPaddingBottom(20);
	        cellS.setPaddingLeft(90);
	        cellS.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cellS.setHorizontalAlignment(Element.ALIGN_CENTER);
	        cellS.setBorder(Rectangle.NO_BORDER);
	        tableST.addCell(cellS);
	        
	        cellS = new PdfPCell(new Paragraph(new Phrase(0f,"MONTH REPORT",FontFactory.getFont(FontFactory.TIMES_ROMAN, 12f,Font.UNDERLINE))));
	        cellS.setColspan(9);
	        cellS.setPaddingBottom(12);
	        cellS.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cellS.setHorizontalAlignment(Element.ALIGN_LEFT);
	        cellS.setBorder(Rectangle.NO_BORDER);
	        tableST.addCell(cellS);
	        
	        document.add(tableST);
	        
	        document.add(new Chunk(ls));
	        
		    
/** ######################################################################################################################################### **/
	    
	        
/**-----------------------------------------------  Content Table -----------------------------------------------------------------------      **/
	        
	        
				    PdfPTable table = new PdfPTable(4); // 4 columns.
			        table.setWidthPercentage(100); //Width 100%
			        table.setSpacingBefore(10f); //Space before table
			        table.setSpacingAfter(10f); //Space after table
			 
			        //Set Column widths
			        float[] columnWidths = {1.5f, 1f, 1f, 1f};
			        table.setWidths(columnWidths);
			        
			        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
			        
			        PdfPCell cell1 = new PdfPCell(new Paragraph("Month"));
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph(month));
			        cell1.setFixedHeight(25f);
			        cell1.setColspan(4);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
				    
			        /** ----------------------------------------------------------- **/
			        
			        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
				    cell1 = new PdfPCell(new Paragraph("Stored Date"));
				    cell1.setFixedHeight(25f);
			        cell1.setBackgroundColor(BaseColor.LIGHT_GRAY);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        
			        cell1 = new PdfPCell(new Paragraph("Tea Grade"));
			        cell1.setBackgroundColor(BaseColor.LIGHT_GRAY);
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Stored Quantity"));
			        cell1.setBackgroundColor(BaseColor.LIGHT_GRAY);
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Stored Location"));
			        cell1.setBackgroundColor(BaseColor.LIGHT_GRAY);
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        
			        for(TeaStock tea : TeaList) {
			        
			        	cell1 = new PdfPCell(new Paragraph(tea.getStoring_Date()));
				        cell1.setFixedHeight(28f);
				        cell1.setPaddingLeft(10);
				        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
				        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        	table.addCell(cell1);
			        	
			        	cell1 = new PdfPCell(new Paragraph(tea.getTea_Grades()));
				        cell1.setFixedHeight(28f);
				        cell1.setPaddingLeft(10);
				        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
				        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        	table.addCell(cell1);
			        	
			        	cell1 = new PdfPCell(new Paragraph(tea.getTea_Grades_Qty()));
				        cell1.setFixedHeight(28f);
				        cell1.setPaddingLeft(10);
				        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
				        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        	table.addCell(cell1);
			        	
			        	cell1 = new PdfPCell(new Paragraph(tea.getLocation()));
				        cell1.setFixedHeight(28f);
				        cell1.setPaddingLeft(10);
				        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
				        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        	table.addCell(cell1);
			        	
			        }
			        
			        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
			        cell1 = new PdfPCell(new Paragraph("Total Stored Qty(Kg):"));
			        cell1.setFixedHeight(25f);
			        cell1.setColspan(2);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        float sumOT = 0;
			        for (int i = 0; i < TeaList.size(); i++) {
						
			        	sumOT = sumOT +Float.parseFloat((TeaList.get(i).getTea_Grades_Qty()));
					}
			        String Tot = String.valueOf(sumOT);
			        
			        cell1 = new PdfPCell(new Paragraph(Tot));
			        cell1.setFixedHeight(25f);
			        cell1.setColspan(5);
			        cell1.setPaddingLeft(110);
			        cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        document.add(table);
			        
			        /** ----------------------------------------------------------- **/
			        
/** ######################################################################################################################################### **/
			      
			      
/**-----------------------------------------------  Footer Table -----------------------------------------------------------------------      **/
			        
			        document.add(new Chunk(ls));
			        
			        PdfPTable tableC = new PdfPTable(1); // 1 columns.
			        tableC.setWidthPercentage(100); //Width 100%
			        tableC.setSpacingBefore(10f); //Space before table
			        tableC.setSpacingAfter(10f); //Space after table
			        
			        //Set Column widths
			        float[] columnWidthsC = {1f};
			        
			        PdfPCell cellC = new PdfPCell();
			        
			        tableC.setWidths(columnWidthsC);
			        cellC = new PdfPCell(new Paragraph(new Phrase(0f,"Copyright @ 2020 Dehiwatta Tea Factory. All Rights Reserved")));
			        cellC.setPaddingLeft(390f);
			        cellC.setPaddingTop(-5f);
			        cellC.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellC.setHorizontalAlignment(Element.ALIGN_MIDDLE);
			        cellC.setBorder(Rectangle.NO_BORDER);
			        tableC.addCell(cellC);
			        
			        document.add(tableC);
		    
			document.close();
			  /** ----------------------------------------------------------- **/
	        
/** ######################################################################################################################################### **/

			System.out.println("Finished");
		} catch (DocumentException |IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public void generateTeaStockReportDay(ArrayList<TeaStock> TeaList,String Date) {
		
		String fileName = "F:\\P\\Stock_Report.pdf"; //PDF file saving location
		Document document = new Document();
		document.setPageSize(PageSize.A2);  //PDF file size
		
		try {
			PdfWriter.getInstance(document, new FileOutputStream(fileName));  //PDF file Creating
			document.open(); //Opening the PDF file
			
			
/** ######################################################################################################################################### **/

		    
/**----------------------------------------------- Header Table -----------------------------------------------------------      **/
			
		    PdfPTable tableT = new PdfPTable(9); // 9 columns.
	        tableT.setWidthPercentage(100); //Width 100%
	        tableT.setSpacingBefore(10f); //Space before table
	        tableT.setSpacingAfter(10f); //Space after table
	        
	        //Set Column widths
	        float[] columnWidthsT = {1.5f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f};
	        tableT.setWidths(columnWidthsT);
	        
	        PdfPCell cell = new PdfPCell(); //Creating new Cell
	        cell.setBorder(Rectangle.NO_BORDER);
	        //Add Image
	        Image image1 = Image.getInstance("F:\\Pro files\\MainLogo.jpeg");
	        cell.addElement(image1);
	        tableT.addCell(cell);

	        float fntSize = 25f;
	        cell = new PdfPCell();
	        cell.addElement(new Phrase(20f,"Dehiwatta Tea Factory",FontFactory.getFont(FontFactory.TIMES_ROMAN, fntSize,Font.BOLD)));
	        cell.addElement(new Phrase(15f,"\nAddress : Hapugahayatatenna,Handessa"));
	        cell.addElement(new Phrase(10f,"\nTel : 0815630035"));
	        cell.addElement(new Phrase(10f,"\nEmail : nmmbrosdtf@gmail.com"));
	        cell.setPaddingLeft(10);
	        cell.setColspan(5);
	        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cell.setBorder(Rectangle.NO_BORDER);
	        tableT.addCell(cell);
	        
	        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");  
	        Date date = new Date();
	        
	        cell = new PdfPCell(new Paragraph("Date:"+formatter.format(date)));
	        cell.setRowspan(4);
	        cell.setColspan(3);
	        cell.setPaddingLeft(10);
	        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        cell.setBorder(Rectangle.NO_BORDER);
	        tableT.addCell(cell);
	        
	        document.add(tableT);
	        
	        LineSeparator ls = new LineSeparator();
	        document.add(new Chunk(ls));
	        
	        PdfPTable tableST = new PdfPTable(9); // 9 columns.
	        tableST.setWidthPercentage(100); //Width 100%
	        tableST.setSpacingBefore(10f); //Space before table
	        tableST.setSpacingAfter(10f); //Space after table
	        
	        //Set Column widths
	        float[] columnWidthsST = {1.5f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f};
	        tableST.setWidths(columnWidthsST);
	        
	        PdfPCell cellS = new PdfPCell();
	        cellS = new PdfPCell(new Paragraph(new Phrase(0f,"TEA STOCK REPORT")));
	        cellS.setColspan(5);
	        cellS.setPaddingBottom(8);
	        cellS.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cellS.setHorizontalAlignment(Element.ALIGN_LEFT);
	        cellS.setBorder(Rectangle.NO_BORDER);
	        tableST.addCell(cellS);
	        
	        cellS = new PdfPCell(new Paragraph("Month :"+TeaList.get(0).getMonth()));
	        cellS.setColspan(6);
	        cellS.setPaddingBottom(20);
	        cellS.setPaddingLeft(90);
	        cellS.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cellS.setHorizontalAlignment(Element.ALIGN_CENTER);
	        cellS.setBorder(Rectangle.NO_BORDER);
	        tableST.addCell(cellS);
	        
	        cellS = new PdfPCell(new Paragraph(new Phrase(0f,"DAY REPORT",FontFactory.getFont(FontFactory.TIMES_ROMAN, 12f,Font.UNDERLINE))));
	        cellS.setColspan(9);
	        cellS.setPaddingBottom(12);
	        cellS.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cellS.setHorizontalAlignment(Element.ALIGN_LEFT);
	        cellS.setBorder(Rectangle.NO_BORDER);
	        tableST.addCell(cellS);
	        
	        document.add(tableST);
	        
	        document.add(new Chunk(ls));
	        
		    
/** ######################################################################################################################################### **/
	    
	        
/**-----------------------------------------------  Content Table -----------------------------------------------------------------------      **/
	        
	        
				    PdfPTable table = new PdfPTable(3); // 4 columns.
			        table.setWidthPercentage(100); //Width 100%
			        table.setSpacingBefore(10f); //Space before table
			        table.setSpacingAfter(10f); //Space after table
			 
			        //Set Column widths
			        float[] columnWidths = {1.5f, 1f, 1f};
			        table.setWidths(columnWidths);
			        
			        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
			        
			        PdfPCell cell1 = new PdfPCell(new Paragraph("Date"));
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph(Date));
			        cell1.setFixedHeight(25f);
			        cell1.setColspan(4);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
				    
			        /** ----------------------------------------------------------- **/
			        
			        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
				    cell1 = new PdfPCell(new Paragraph("Tea Grade"));
				    cell1.setFixedHeight(25f);
			        cell1.setBackgroundColor(BaseColor.LIGHT_GRAY);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Stored Quantity"));
			        cell1.setBackgroundColor(BaseColor.LIGHT_GRAY);
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Stored Location"));
			        cell1.setBackgroundColor(BaseColor.LIGHT_GRAY);
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        
			        for(TeaStock tea : TeaList) {
			        
			        	cell1 = new PdfPCell(new Paragraph(tea.getTea_Grades()));
				        cell1.setFixedHeight(28f);
				        cell1.setPaddingLeft(10);
				        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
				        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        	table.addCell(cell1);
			        	
			        	
			        	cell1 = new PdfPCell(new Paragraph(tea.getLocation()));
				        cell1.setFixedHeight(28f);
				        cell1.setPaddingLeft(10);
				        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
				        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        	table.addCell(cell1);
			        	
			        	cell1 = new PdfPCell(new Paragraph(tea.getTea_Grades_Qty()));
			        	cell1.setFixedHeight(28f);
			        	cell1.setPaddingLeft(10);
			        	cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        	cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        	table.addCell(cell1);
			        }
			        
			        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
			        cell1 = new PdfPCell(new Paragraph("Total Stored Qty(Kg):"));
			        cell1.setFixedHeight(25f);
			        cell1.setColspan(2);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        float sumOT = 0;
			        for (int i = 0; i < TeaList.size(); i++) {
						
			        	sumOT = sumOT +Float.parseFloat((TeaList.get(i).getTea_Grades_Qty()));
					}
			        String Tot = String.valueOf(sumOT);
			        
			        cell1 = new PdfPCell(new Paragraph(Tot));
			        cell1.setFixedHeight(25f);
			        //cell1.setColspan(5);
			        cell1.setPaddingLeft(110);
			        cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        document.add(table);
			        
			        /** ----------------------------------------------------------- **/
			        
/** ######################################################################################################################################### **/
			      
			      
/**-----------------------------------------------  Footer Table -----------------------------------------------------------------------      **/
			        
			        document.add(new Chunk(ls));
			        
			        PdfPTable tableC = new PdfPTable(1); // 1 columns.
			        tableC.setWidthPercentage(100); //Width 100%
			        tableC.setSpacingBefore(10f); //Space before table
			        tableC.setSpacingAfter(10f); //Space after table
			        
			        //Set Column widths
			        float[] columnWidthsC = {1f};
			        
			        PdfPCell cellC = new PdfPCell();
			        
			        tableC.setWidths(columnWidthsC);
			        cellC = new PdfPCell(new Paragraph(new Phrase(0f,"Copyright @ 2020 Dehiwatta Tea Factory. All Rights Reserved")));
			        cellC.setPaddingLeft(390f);
			        cellC.setPaddingTop(-5f);
			        cellC.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellC.setHorizontalAlignment(Element.ALIGN_MIDDLE);
			        cellC.setBorder(Rectangle.NO_BORDER);
			        tableC.addCell(cellC);
			        
			        document.add(tableC);
		    
			document.close();
			  /** ----------------------------------------------------------- **/
	        
/** ######################################################################################################################################### **/

			System.out.println("Finished");
		} catch (DocumentException |IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

package fms.Sales.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.fms.model.FactorySales;
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

/**
 * @author Zumry A.M
 *IT NO:IT19175126
 *
 */


public class FactorySales_Report_GeneratingServiceImpt implements FactorySales_Report_GeneratingService {
	
	@Override
	public void generateFactorySaleReportMonth(ArrayList<FactorySales> salesList,String month) throws DocumentException, IOException {
		
		String fileName = "C:\\Users\\amzum\\Desktop\\ITP report\\FactorySales_Month_Report.pdf"; //PDF file saving location
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
	        Image image1 = Image.getInstance("C:\\Users\\amzum\\Desktop\\ITP report\\MainLogo.jpeg");
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
	        
	        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy, HH:mm:ss");  
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
	        cellS = new PdfPCell(new Paragraph(new Phrase(0f,"FACTORY SALES REPORT")));
	        cellS.setColspan(5);
	        cellS.setPaddingBottom(8);
	        cellS.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cellS.setHorizontalAlignment(Element.ALIGN_LEFT);
	        cellS.setBorder(Rectangle.NO_BORDER);
	        tableST.addCell(cellS);
	        
	        cellS = new PdfPCell(new Paragraph("Month : "+month));
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
	        
	        
				    PdfPTable table = new PdfPTable(3); // 3 columns.
			        table.setWidthPercentage(100); //Width 100%
			        table.setSpacingBefore(10f); //Space before table
			        table.setSpacingAfter(10f); //Space after table
			 
			        //Set Column widths
			        float[] columnWidths = {1f, 1f, 1f};
			        table.setWidths(columnWidths);
			        
			        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
			        
			        PdfPCell cell1 = new PdfPCell(new Paragraph("Date of sale"));
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Tea Grade"));
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Selling Quantity(kg)"));
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);

			        
			        for(FactorySales fs : salesList) {
			        
			        	cell1 = new PdfPCell(new Paragraph(fs.getDate()));
				        cell1.setFixedHeight(28f);
				        cell1.setPaddingLeft(10);
				        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
				        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        	table.addCell(cell1);
			        	
			        	cell1 = new PdfPCell(new Paragraph(fs.getTea_Grade()));
				        cell1.setFixedHeight(28f);
				        cell1.setPaddingLeft(10);
				        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
				        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        	table.addCell(cell1);
			        	
			        	cell1 = new PdfPCell(new Paragraph(fs.getSelling_Quantity()));
				        cell1.setFixedHeight(28f);
				        cell1.setPaddingLeft(10);
				        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
				        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        	table.addCell(cell1);
			        }
			        
			        document.add(table);
			        
			        document.add(new Chunk(ls));
			        
			        /** ----------------------------------------------------------- **/
			        
/** ######################################################################################################################################### **/
			      
			      
/**-----------------------------------------------  Footer Table -----------------------------------------------------------------------      **/

			        
			        
	 
			        /** ----------------------------------------------------------- **/
			        
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


	@Override
	public void generateFactorySaleReportYearly(ArrayList<FactorySales> salesList,String Year) {
		
		String fileName = "C:\\Users\\amzum\\Desktop\\ITP report\\FactorySales_Year_Report2.pdf";
		Document document = new Document();
		document.setPageSize(PageSize.A3);
		
		try {
			PdfWriter.getInstance(document, new FileOutputStream(fileName));
			document.open();
			
			
			/** ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' **/
/** ######################################################################################################################################### **/

		    
/**----------------------------------------------- Header Table -----------------------------------------------------------      **/
		    
		    PdfPTable tableT = new PdfPTable(9); // 9 columns.
	        tableT.setWidthPercentage(100); //Width 100%
	        tableT.setSpacingBefore(10f); //Space before table
	        tableT.setSpacingAfter(10f); //Space after table
	        
	        //Set Column widths
	        float[] columnWidthsT = {1.5f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f};
	        tableT.setWidths(columnWidthsT);
	        
	        PdfPCell cell = new PdfPCell();
	        cell.setBorder(Rectangle.NO_BORDER);
	        //Add Image
	        Image image1 = Image.getInstance("C:\\Users\\amzum\\Desktop\\ITP report\\MainLogo.jpeg");
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
	        
	        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy, HH:mm:ss");  
	        Date date1 = new Date();
	        
	        cell = new PdfPCell(new Paragraph("Date:"+formatter.format(date1)));
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
	        cellS = new PdfPCell(new Paragraph(new Phrase(0f,"FACTORY SALES REPORT")));
	        cellS.setColspan(5);
	        cellS.setPaddingBottom(8);
	        cellS.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cellS.setHorizontalAlignment(Element.ALIGN_LEFT);
	        cellS.setBorder(Rectangle.NO_BORDER);
	        tableST.addCell(cellS);
	        
	        cellS = new PdfPCell(new Paragraph("Year : " + salesList.get(0).getYear()));
	        cellS.setColspan(6);
	        cellS.setPaddingLeft(90);
	        cellS.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cellS.setHorizontalAlignment(Element.ALIGN_CENTER);
	        cellS.setBorder(Rectangle.NO_BORDER);
	        tableST.addCell(cellS);
	        
	        cellS = new PdfPCell(new Paragraph(new Phrase(0f,"YEAR REPORT",FontFactory.getFont(FontFactory.TIMES_ROMAN, 12f,Font.UNDERLINE))));
	        cellS.setColspan(9);
	        cellS.setPaddingBottom(8);
	        cellS.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cellS.setHorizontalAlignment(Element.ALIGN_LEFT);
	        cellS.setBorder(Rectangle.NO_BORDER);
	        tableST.addCell(cellS);
	        
	        document.add(tableST);
	        
	        document.add(new Chunk(ls));
	        
/** ######################################################################################################################################### **/

		    
/**----------------------------------------------- Content Table -----------------------------------------------------------      **/
	        
		    PdfPTable table = new PdfPTable(4); // 3 columns.
	        table.setWidthPercentage(100); //Width 100%
	        table.setSpacingBefore(10f); //Space before table
	        table.setSpacingAfter(10f); //Space after table
	 
	        //Set Column widths
	        float[] columnWidths = {1f, 1f, 1f, 1f};
	        table.setWidths(columnWidths);
	        
	        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
	        
	        PdfPCell cell1 = new PdfPCell(new Paragraph("No of Sales"));
	        cell1.setFixedHeight(25f);
	        cell1.setPaddingLeft(10);
	        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
	        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        table.addCell(cell1);
	        
	        cell1 = new PdfPCell(new Paragraph("Month of Sales"));
	        cell1.setFixedHeight(25f);
	        cell1.setPaddingLeft(10);
	        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
	        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        table.addCell(cell1);
	        
	        cell1 = new PdfPCell(new Paragraph("Tea Grade"));
	        cell1.setFixedHeight(25f);
	        cell1.setPaddingLeft(10);
	        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
	        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        table.addCell(cell1);
	        
	        cell1 = new PdfPCell(new Paragraph("Selling Quantity(kg)"));
	        cell1.setFixedHeight(25f);
	        cell1.setPaddingLeft(10);
	        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
	        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        table.addCell(cell1);

	        
	        for(FactorySales fs : salesList) {
	        
	        	cell1 = new PdfPCell(new Paragraph(fs.getTea_Grade_PriceID()));
		        cell1.setFixedHeight(28f);
		        cell1.setPaddingLeft(10);
		        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        	table.addCell(cell1);
	        	
	        	cell1 = new PdfPCell(new Paragraph(fs.getMonth()));
		        cell1.setFixedHeight(28f);
		        cell1.setPaddingLeft(10);
		        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        	table.addCell(cell1);
	        	
	        	cell1 = new PdfPCell(new Paragraph(fs.getTea_Grade()));
		        cell1.setFixedHeight(28f);
		        cell1.setPaddingLeft(10);
		        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        	table.addCell(cell1);
	        	
	        	cell1 = new PdfPCell(new Paragraph(fs.getSelling_Quantity()));
		        cell1.setFixedHeight(28f);
		        cell1.setPaddingLeft(10);
		        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
		        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        	table.addCell(cell1);
	        }
	        
	        document.add(table);
	        
	        document.add(new Chunk(ls));
	        
	        /** ----------------------------------------------------------- **/
	        
			        
/** ######################################################################################################################################### **/

				    
/**----------------------------------------------- Footer Table -----------------------------------------------------------      **/
			        
			        

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
			        cellC.setPaddingLeft(230f);
			        cellC.setPaddingTop(-5f);
			        cellC.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellC.setHorizontalAlignment(Element.ALIGN_MIDDLE);
			        cellC.setBorder(Rectangle.NO_BORDER);
			        tableC.addCell(cellC);
			        
			        document.add(tableC);
		    
			document.close();
			
/** ######################################################################################################################################### **/

		    
			System.out.println("Finished");
		} catch (DocumentException |IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}

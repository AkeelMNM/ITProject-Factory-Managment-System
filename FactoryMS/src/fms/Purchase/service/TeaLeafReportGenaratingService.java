package fms.Purchase.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;

import com.fms.model.PaymentToSuppliers;

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
//import com.sun.prism.shader.Solid_LinearGradient_PAD_AlphaTest_Loader;





public class TeaLeafReportGenaratingService {
	
	

	public void generatePTReportMonth(ArrayList<PaymentToSuppliers> ptList,String month) throws DocumentException, IOException {
		
		String fileName = "F:\\P\\EPT_Report2.pdf"; //PDF file saving location
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
	        cellS = new PdfPCell(new Paragraph(new Phrase(0f,"TEA LEAF ORDER REPORT")));
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
	        
	        
				    PdfPTable table = new PdfPTable(8); // 8 columns.
			        table.setWidthPercentage(100); //Width 100%
			        table.setSpacingBefore(10f); //Space before table
			        table.setSpacingAfter(10f); //Space after table
			 
			        //Set Column widths
			        float[] columnWidths = {1.5f, 1f, 1f, 1f, 1f, 1f, 1f, 1f};
			        table.setWidths(columnWidths);
			        
			        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
			        
			        PdfPCell cell1 = new PdfPCell(new Paragraph("Supplier Name"));
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph(ptList.get(0).getName()));
			        cell1.setFixedHeight(25f);
			        cell1.setColspan(8);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Quantity"));
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph(ptList.get(0).getFinal_Amount()));
			        cell1.setFixedHeight(25f);
			        cell1.setColspan(8);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        
			       
			    
				    
			        /** ----------------------------------------------------------- **/
			        
			        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
				    cell1 = new PdfPCell(new Paragraph("Date"));
				    cell1.setFixedHeight(25f);
			        cell1.setBackgroundColor(BaseColor.LIGHT_GRAY);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			 
			     
			        
			        cell1 = new PdfPCell(new Paragraph("Description"));
			        cell1.setBackgroundColor(BaseColor.LIGHT_GRAY);
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        /** ----------------------------------------------------------- **/
			        Image imageS1 = Image.getInstance("F:\\Pro files\\FullStar.png");
			        Image imageS2 = Image.getInstance("F:\\Pro files\\EmptyStar.png");
			        //Scale to new height and new width of image
			        imageS1.scaleAbsolute(20, 20);
			        imageS2.scaleAbsolute(20, 20);
			        
			        Paragraph paraS = new Paragraph();
			        cell1 = new PdfPCell();
			        
			        
			        
			        
			        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
			        cell1 = new PdfPCell(new Paragraph("Total :"));
			        cell1.setFixedHeight(25f);
			        cell1.setColspan(5);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        float sumOT = 0;
			        
			        String Tot = String.valueOf(sumOT);
			        
			        cell1 = new PdfPCell(new Paragraph(Tot));
			        cell1.setFixedHeight(25f);
			        cell1.setColspan(5);
			        cell1.setPaddingLeft(110);
			        cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        document.add(table);
			        
			        document.add(new Chunk(ls));
			        
			        /** ----------------------------------------------------------- **/
			        
/** ######################################################################################################################################### **/
			      
			      
/**-----------------------------------------------  Footer Table -----------------------------------------------------------------------      **/

			        
			        Image imageR1 = Image.getInstance("F:\\Pro files\\FullStar.png");
			        Image imageR2 = Image.getInstance("F:\\Pro files\\EmptyStar.png");
			        //Scale to new height and new width of image
			        imageR1.scaleAbsolute(15, 15);
			        imageR2.scaleAbsolute(15, 15);
			        
			        PdfPTable tableR = new PdfPTable(11); // 11 columns.
			        tableR.setWidthPercentage(100); //Width 100%
			        tableR.setSpacingBefore(10f); //Space before table
			        tableR.setSpacingAfter(10f); //Space after table
			        
			        //Set Column widths
			        float[] columnWidthsR = {1.5f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f ,1f};
			        tableR.setWidths(columnWidthsR);
			        
	/*		        PdfPCell cellR = new PdfPCell();
			        cellR = new PdfPCell(new Paragraph(new Phrase(0f,"Performance Range:")));
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setHorizontalAlignment(Element.ALIGN_LEFT);
			        cellR.setBorder(Rectangle.NO_BORDER);
			        tableR.addCell(cellR);
			        
			        
			        cellR = new PdfPCell(new Paragraph(new Phrase(0f,"Excellent :")));
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        cellR.setBorder(Rectangle.NO_BORDER);
			        tableR.addCell(cellR);
			        
			        Paragraph paraR = new Paragraph();
			        
					for(int i = 0;i < 5;i++){
							paraR.add(new Chunk(imageR1, 0, 0, true));
							
					}
					cellR = new PdfPCell(new Paragraph());
					cellR.setFixedHeight(25f);
			        cellR.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setBorder(Rectangle.NO_BORDER);
					cellR.addElement(paraR);
					tableR.addCell(cellR);
					
					cellR = new PdfPCell(new Paragraph(new Phrase(0f,"Good :")));
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        cellR.setBorder(Rectangle.NO_BORDER);
			        tableR.addCell(cellR);
			        
			        Paragraph paraR1 = new Paragraph();
			        
			        for(int i = 0;i < 4;i++){
						paraR1.add(new Chunk(imageR1, 0, 0, true));
						
			        }
			        for(int i = 0;i < 1;i++){
						paraR1.add(new Chunk(imageR2, 0, 0, true));
			        }
			        
			        cellR = new PdfPCell(new Paragraph());
					cellR.setFixedHeight(25f);
			        cellR.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setBorder(Rectangle.NO_BORDER);
					cellR.addElement(paraR1);
					tableR.addCell(cellR);
					
					cellR = new PdfPCell(new Paragraph(new Phrase(0f,"Average :")));
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        cellR.setBorder(Rectangle.NO_BORDER);
			        tableR.addCell(cellR);
					
			        Paragraph paraR2 = new Paragraph();
			        
					for(int i = 0;i < 3;i++){
						paraR2.add(new Chunk(imageR1, 0, 0, true));
						
			        }
			        for(int i = 0;i < 2;i++){
						paraR2.add(new Chunk(imageR2, 0, 0, true));
			        }
			        
			        cellR = new PdfPCell(new Paragraph());
					cellR.setFixedHeight(25f);
			        cellR.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setBorder(Rectangle.NO_BORDER);
					cellR.addElement(paraR2);
					tableR.addCell(cellR);
					
					cellR = new PdfPCell(new Paragraph(new Phrase(0f,"Fair :")));
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        cellR.setBorder(Rectangle.NO_BORDER);
			        tableR.addCell(cellR);
			        
			        Paragraph paraR3 = new Paragraph();
			        
					for(int i = 0;i < 2;i++){
						paraR3.add(new Chunk(imageR1, 0, 0, true));
						
			        }
			        for(int i = 0;i < 3;i++){
						paraR3.add(new Chunk(imageR2, 0, 0, true));
			        }
			        
			        cellR = new PdfPCell(new Paragraph());
					cellR.setFixedHeight(25f);
					
			        cellR.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setBorder(Rectangle.NO_BORDER);
					cellR.addElement(paraR3);
					tableR.addCell(cellR);
					
					cellR = new PdfPCell(new Paragraph(new Phrase(0f,"Poor :")));
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        cellR.setBorder(Rectangle.NO_BORDER);
			        tableR.addCell(cellR);               
			        
			        Paragraph paraR4 = new Paragraph();
			        
					for(int i = 0;i < 1;i++){
						paraR4.add(new Chunk(imageR1, 0, 0, true));
						
			        }
			        for(int i = 0;i < 4;i++){
						paraR4.add(new Chunk(imageR2, 0, 0, true));
			        }
			        
			        cellR = new PdfPCell(new Paragraph());
					cellR.setFixedHeight(25f);
					
			        cellR.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setBorder(Rectangle.NO_BORDER);
					cellR.addElement(paraR4);
					tableR.addCell(cellR);
			        
			        document.add(tableR); */
	 
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
	
	public void generatePTReportDay(ArrayList<PaymentToSuppliers> ptList,String date) {
		
		String fileName = "F:\\P\\EPT_Report3.pdf";
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
	        cellS = new PdfPCell(new Paragraph(new Phrase(0f,"TEA LEAF ORDER REPORT")));
	        cellS.setColspan(5);
	        cellS.setPaddingBottom(8);
	        cellS.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cellS.setHorizontalAlignment(Element.ALIGN_LEFT);
	        cellS.setBorder(Rectangle.NO_BORDER);
	        tableST.addCell(cellS);
	        
	        cellS = new PdfPCell(new Paragraph("Month :" + ptList.get(0).getDate()));       /*month changed to data*/
	        cellS.setColspan(6);
	        cellS.setPaddingLeft(90);
	        cellS.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cellS.setHorizontalAlignment(Element.ALIGN_CENTER);
	        cellS.setBorder(Rectangle.NO_BORDER);
	        tableST.addCell(cellS);
	        
	        cellS = new PdfPCell(new Paragraph(new Phrase(0f,"DAY REPORT",FontFactory.getFont(FontFactory.TIMES_ROMAN, 12f,Font.UNDERLINE))));
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
	        
				    PdfPTable table = new PdfPTable(2); // 2 columns.
			        table.setWidthPercentage(100); //Width 100%
			        table.setSpacingBefore(10f); //Space before table
			        table.setSpacingAfter(10f); //Space after table
			 
			        //Set Column widths
			        float[] columnWidths = {1f, 1f};
			        table.setWidths(columnWidths);
			        
			        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
			        
			        PdfPCell cell1 = new PdfPCell(new Paragraph("Supplier Name"));
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph(ptList.get(0).getName()));
			        cell1.setFixedHeight(25f);
			        cell1.setColspan(8);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Quantity"));
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph(ptList.get(0).getPayment_Type()));
			        cell1.setFixedHeight(25f);
			        cell1.setColspan(8);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
				    
			        /** ----------------------------------------------------------- **/
			        
			        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
				    cell1 = new PdfPCell(new Paragraph("Date"));
				    cell1.setFixedHeight(25f);
			        cell1.setBackgroundColor(BaseColor.CYAN);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph(ptList.get(0).getDate()));
				    cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        
			      
			        
			        cell1 = new PdfPCell(new Paragraph("Over Time (hr)"));
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph(ptList.get(0).getFinal_Amount()));
				    cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Performance"));
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			      
			        
			        Paragraph paraS = new Paragraph();
			        cell1 = new PdfPCell();

				        int starfull =Integer. parseInt(ptList.get(0).getPayment_Type());
						int starempty = 5 - starfull;
						
						
					cell1 = new PdfPCell(new Paragraph());
				    cell1.setFixedHeight(28f);
				    cell1.setPaddingLeft(10);
				    cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
					cell1.addElement(paraS);
				    table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Description"));
			        cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph(ptList.get(0).getIspaid()));
				    cell1.setFixedHeight(25f);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        document.add(table);
			        document.add(new Chunk(ls));
			        
/** ######################################################################################################################################### **/

				    
/**----------------------------------------------- Footer Table -----------------------------------------------------------      **/
			        
			        Image imageR1 = Image.getInstance("F:\\Pro files\\FullStar.png");
			        Image imageR2 = Image.getInstance("F:\\Pro files\\EmptyStar.png");
			        //Scale to new height and new width of image
			        imageR1.scaleAbsolute(13, 13);
			        imageR2.scaleAbsolute(13, 13);
			        
			        PdfPTable tableR = new PdfPTable(11); // 11 columns.
			        tableR.setWidthPercentage(100); //Width 100%
			        tableR.setSpacingBefore(10f); //Space before table
			        tableR.setSpacingAfter(10f); //Space after table
			        
			        //Set Column widths
			        float[] columnWidthsR = {1.5f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f ,1f};
			        tableR.setWidths(columnWidthsR);
			        
			        PdfPCell cellR = new PdfPCell();
			        cellR = new PdfPCell(new Paragraph(new Phrase(0f,"Performance Range:",FontFactory.getFont(FontFactory.TIMES_ROMAN, 10f))));
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setHorizontalAlignment(Element.ALIGN_LEFT);
			        cellR.setBorder(Rectangle.NO_BORDER);
			        tableR.addCell(cellR);
			        
			        
			        cellR = new PdfPCell(new Paragraph(new Phrase(0f,"Excellent :",FontFactory.getFont(FontFactory.TIMES_ROMAN, 10f))));
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        cellR.setBorder(Rectangle.NO_BORDER);
			        tableR.addCell(cellR);
			        
			        Paragraph paraR = new Paragraph();
			        
					for(int i = 0;i < 5;i++){
							paraR.add(new Chunk(imageR1, 0, 0, true));
							
					}
					cellR = new PdfPCell(new Paragraph());
					cellR.setFixedHeight(25f);
			        cellR.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setBorder(Rectangle.NO_BORDER);
					cellR.addElement(paraR);
					tableR.addCell(cellR);
					
					cellR = new PdfPCell(new Paragraph(new Phrase(0f,"Good :",FontFactory.getFont(FontFactory.TIMES_ROMAN, 10f))));
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        cellR.setBorder(Rectangle.NO_BORDER);
			        tableR.addCell(cellR);
			        
			        Paragraph paraR1 = new Paragraph();
			        
			        for(int i = 0;i < 4;i++){
						paraR1.add(new Chunk(imageR1, 0, 0, true));
						
			        }
			        for(int i = 0;i < 1;i++){
						paraR1.add(new Chunk(imageR2, 0, 0, true));
			        }
			        
			        cellR = new PdfPCell(new Paragraph());
					cellR.setFixedHeight(25f);
			        cellR.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setBorder(Rectangle.NO_BORDER);
					cellR.addElement(paraR1);
					tableR.addCell(cellR);
					
					cellR = new PdfPCell(new Paragraph(new Phrase(0f,"Average :",FontFactory.getFont(FontFactory.TIMES_ROMAN, 10f))));
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        cellR.setBorder(Rectangle.NO_BORDER);
			        tableR.addCell(cellR);
					
			        Paragraph paraR2 = new Paragraph();
			        
					for(int i = 0;i < 3;i++){
						paraR2.add(new Chunk(imageR1, 0, 0, true));
						
			        }
			        for(int i = 0;i < 2;i++){
						paraR2.add(new Chunk(imageR2, 0, 0, true));
			        }
			        
			        cellR = new PdfPCell(new Paragraph());
					cellR.setFixedHeight(25f);
			        cellR.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setBorder(Rectangle.NO_BORDER);
					cellR.addElement(paraR2);
					tableR.addCell(cellR);
					
					cellR = new PdfPCell(new Paragraph(new Phrase(0f,"Fair :",FontFactory.getFont(FontFactory.TIMES_ROMAN, 10f))));
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        cellR.setBorder(Rectangle.NO_BORDER);
			        tableR.addCell(cellR);
			        
			        Paragraph paraR3 = new Paragraph();
			        
					for(int i = 0;i < 2;i++){
						paraR3.add(new Chunk(imageR1, 0, 0, true));
						
			        }
			        for(int i = 0;i < 3;i++){
						paraR3.add(new Chunk(imageR2, 0, 0, true));
			        }
			        
			        cellR = new PdfPCell(new Paragraph());
					cellR.setFixedHeight(25f);
			        cellR.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setBorder(Rectangle.NO_BORDER);
					cellR.addElement(paraR3);
					tableR.addCell(cellR);
					
					cellR = new PdfPCell(new Paragraph(new Phrase(0f,"Poor :",FontFactory.getFont(FontFactory.TIMES_ROMAN, 10f))));
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        cellR.setBorder(Rectangle.NO_BORDER);
			        tableR.addCell(cellR);
			        
			        Paragraph paraR4 = new Paragraph();
			        
					for(int i = 0;i < 1;i++){
						paraR4.add(new Chunk(imageR1, 0, 0, true));
						
			        }
			        for(int i = 0;i < 4;i++){
						paraR4.add(new Chunk(imageR2, 0, 0, true));
			        }
			        
			        cellR = new PdfPCell(new Paragraph());
					cellR.setFixedHeight(25f);
					
			        cellR.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cellR.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        cellR.setBorder(Rectangle.NO_BORDER);
					cellR.addElement(paraR4);
					tableR.addCell(cellR);
			        
			        document.add(tableR);
	 

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

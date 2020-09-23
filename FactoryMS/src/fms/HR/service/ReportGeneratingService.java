package fms.HR.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.logging.Level;

import com.itextpdf.text.BaseColor;
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

public class ReportGeneratingService {
	
	
	public void generatePTRepot() throws DocumentException, IOException {
		
		String fileName = "F:\\P\\EPT_Report.pdf";
		Document document = new Document();
		document.setPageSize(PageSize.A2);
		
		try {
			PdfWriter.getInstance(document, new FileOutputStream(fileName));
			document.open();
			
			
			/** ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' **/
		    
		    
		    PdfPTable tableT = new PdfPTable(9); // 3 columns.
	        tableT.setWidthPercentage(100); //Width 100%
	        tableT.setSpacingBefore(10f); //Space before table
	        tableT.setSpacingAfter(10f); //Space after table
	        
	        //Set Column widths
	        float[] columnWidthsT = {1.5f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f};
	        tableT.setWidths(columnWidthsT);
	        
	        PdfPCell cell = new PdfPCell();
	        cell.setBorder(Rectangle.NO_BORDER);
	        //Add Image
	        Image image1 = Image.getInstance("F:\\Pro files\\A.jpg");
	        //Fixed Positioning
	        //image1.setAbsolutePosition(100f, 550f);
	        //Scale to new height and new width of image
	        //image1.scaleAbsolute(100, 100);
	        cell.addElement(image1);
	        tableT.addCell(cell);

	        float fntSize = 25f;
	        cell = new PdfPCell();
	        cell.addElement(new Phrase(20f,"Dehiwatta Tea Factory",FontFactory.getFont(FontFactory.TIMES_ROMAN, fntSize,Font.BOLD)));
	        cell.addElement(new Phrase(15f,"\nAddress : Hapugahayatatenna,Handessa"));
	        cell.addElement(new Phrase(10f,"\nTel : Hapugahayatatenna,Handessa"));
	        cell.addElement(new Phrase(10f,"\nEmail : Hapugahayatatenna,Handessa"));
	        cell.setPaddingLeft(10);
	        cell.setColspan(5);
	        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cell.setBorder(Rectangle.NO_BORDER);
	        tableT.addCell(cell);
	        
	        cell = new PdfPCell(new Paragraph("Date"));
	        cell.setRowspan(4);
	        cell.setColspan(3);
	        cell.setPaddingLeft(10);
	        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        cell.setBorder(Rectangle.NO_BORDER);
	        tableT.addCell(cell);
	        
	        //document.add(Chunk.NEWLINE);
	        
	        cell = new PdfPCell(new Paragraph(new Phrase(0f,"EMPLOYEE PERFORMANCE TRACKING & TIME CARD REPORT")));
	        cell.setColspan(5);
	        cell.setPaddingTop(15);
	        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
	        cell.setBorder(Rectangle.NO_BORDER);
	        tableT.addCell(cell);
	        
	        cell = new PdfPCell(new Paragraph("Month :"));
	        cell.setColspan(6);
	        cell.setPaddingLeft(10);
	        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        cell.setBorder(Rectangle.NO_BORDER);
	        tableT.addCell(cell);
	        
	        document.add(tableT);
	        
		    
		    /** ####################################################################################### **/
		    
		    /** ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' **/
				    PdfPTable table = new PdfPTable(9); // 9 columns.
			        table.setWidthPercentage(100); //Width 100%
			        table.setSpacingBefore(10f); //Space before table
			        table.setSpacingAfter(10f); //Space after table
			 
			        //Set Column widths
			        float[] columnWidths = {1.5f, 1f, 1f, 1f, 1f, 1f, 1f, 1f, 1f};
			        table.setWidths(columnWidths);
			        
			        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
			        
			        PdfPCell cell1 = new PdfPCell(new Paragraph("Employee Name"));
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph(""));
			        cell1.setColspan(8);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Job Title"));
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph(""));
			        cell1.setColspan(8);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Overall Performance"));
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph(""));
			        cell1.setColspan(8);
			        cell1.setPaddingLeft(10);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
				    
			        /** ----------------------------------------------------------- **/
			        
			        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
				    cell1 = new PdfPCell(new Paragraph("Date"));
			        cell1.setBackgroundColor(BaseColor.CYAN);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Attended"));
			        cell1.setBackgroundColor(BaseColor.CYAN);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Time In"));
			        cell1.setBackgroundColor(BaseColor.CYAN);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Lunch In"));
			        cell1.setBackgroundColor(BaseColor.CYAN);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Lunch Out"));
			        cell1.setBackgroundColor(BaseColor.CYAN);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Time Out"));
			        cell1.setBackgroundColor(BaseColor.CYAN);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Over Time (hr)"));
			        cell1.setBackgroundColor(BaseColor.CYAN);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Performance"));
			        cell1.setBackgroundColor(BaseColor.CYAN);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("Description"));
			        cell1.setBackgroundColor(BaseColor.CYAN);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        /** ----------------------------------------------------------- **/
			        
			        table.addCell("hi");
			        table.addCell("hi");
			        table.addCell("hi");
			        table.addCell("hi");
			        table.addCell("hi");
			        table.addCell("hi");
			        table.addCell("hi");
			        table.addCell("hi");
			        table.addCell("hi");
			        
			        /** +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ **/
			        cell1 = new PdfPCell(new Paragraph("Total"));
			        cell1.setBackgroundColor(BaseColor.CYAN);
			        cell1.setColspan(6);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        cell1 = new PdfPCell(new Paragraph("0"));
			        cell1.setBackgroundColor(BaseColor.CYAN);
			        cell1.setColspan(3);
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			        table.addCell(cell1);
			        
			        /** ----------------------------------------------------------- **/
			        
			/** ####################################################################################### **/
	        
	        document.add(table);
	        
		    
			document.close();
			System.out.println("Finished");
		} catch (DocumentException |IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
}

package com.fms.QueryUtil;

import java.io.File;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.fms.commonConstant.Common;

public class SalesQueryUtil {

	
	//Method to Read SalesQuary.xml file and Retrieve Query by query id
	
	public static String queryByID(String id) throws SAXException,IOException,ParserConfigurationException
	{
		NodeList nodeList;
		Element element = null;
		
		nodeList = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new File(System.getProperty("catalina.base") + "\\wtpwebapps\\FactoryMS\\WEB-INF\\FactoryMSDBQueryXMLFiles\\SalesQuery.xml"))
				.getElementsByTagName(Common.TAG_NAME);
		
		for(int value = 0; value < nodeList.getLength(); value++)
		{
			element=(Element) nodeList.item(value);
			if(element.getAttribute(Common.ATT_ID).equals(id))
				break;
		}
		return element.getTextContent().trim();
	}

}

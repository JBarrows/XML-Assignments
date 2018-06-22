<?xml version="1.0" encoding="UTF-8"?>
<?altova_samplexml XMLTest.xml?>
<!--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-->
<!-- Created by Joel Barr (776592) -->
<!-- Date: June 22, 2018           -->
<!-- XML Assignment 3              -->
<!--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-->
<!-- Super job here, Joel.  Nice work making everything dynamic and getting the xml
to format and output properly.  Great work
10/10
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" exclude-result-prefixes="array fn map math xhtml xs err" version="3.0">
	<xsl:output method="html" />
	<xsl:template match="/" name="xsl:initial-template">
		<html>
			<head>
				<title>Phone Bill</title>
			</head>
			<body>
				<h1>Customer Info</h1>
				<!-- Print the listed elements by name -->
				<!-- Will need to be adjusted if there are multiple customers -->
				<xsl:for-each select="//name | //address | //city | //province">
					<xsl:value-of select="fn:name(.)"  />
					<xsl:text>: </xsl:text>
					<xsl:value-of select="." />
					<br />
				</xsl:for-each>
				
				<xsl:call-template name="callTable" />
			</body>
		</html>
	</xsl:template>
	
	<!-- Writes all calls in a table.
		Will need to be changed if there are multiple customers --> 
	<xsl:template name="callTable">
		<table border="1">
			<tbody>
				<tr>
					<th>Called Number</th>
					<th>Date</th>
					<th>Duration (minutes)</th>
					<th>Charge</th>
				</tr>
				<xsl:for-each select="//call">
					<tr>
						<!-- Loops through each attribute of the call element
							Requires the attributes to be in the right order -->
						<xsl:for-each select="@*">
							<td><xsl:value-of select="." /></td>
						</xsl:for-each>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>

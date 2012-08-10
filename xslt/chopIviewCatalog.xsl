<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output media-type="text/xml" indent="yes" name="xml"/>
	<xsl:output media-type="text" indent="no" name="text"/>
	
	<!-- batch transformation written by Matthew Stephens, Digital Curation Services, UVA Library -->
	<!-- purpose: process a large iView catalog xml file and break into components based on project (folder) name in Filepath -->
	<!-- created: 		Feb 9, 2011 -->
	<!-- last modified: 	Feb 9, 2011 -->

	<!-- e.g. lib_content37:EAM_Sheet:m000000001:m000000001_0003.tif -->
	<!-- this xpath should provide sort key substring(substring-after(AssetProperties/Filepath/text()[1], 'EAM_Sheet:'), 1, 10) -->
	<!-- need this processing instruction <?expression media exportversion="1.0" appversion="1.0" ?>  -->

	<xsl:template match="/CatalogType/MediaItemList" exclude-result-prefixes="#all">
		<xsl:for-each-group select="./MediaItem"
			group-by="substring(substring-after(AssetProperties/Filepath/text()[1], 'EAM_Sheet:'), 1, 10)">
			<xsl:message>Grabbing node tree <xsl:value-of select="current-grouping-key()"/></xsl:message>
			<xsl:variable select="current-grouping-key()" name="folder"/>
			<xsl:result-document href="output/{$folder}.xml" encoding="UTF-8" format="xml">
				<!-- we need to include PI for expressions media -->
				<xsl:processing-instruction name="expression">media exportversion="1.0" appversion="1.0"</xsl:processing-instruction>
				<xsl:text>
</xsl:text>
				<CatalogType>
					<Catalog pathType="MAC"><xsl:value-of select="$folder"/></Catalog>
					<MediaItemList>
						<xsl:for-each select="current-group()">
							<xsl:copy-of select="."/>
						</xsl:for-each>
					</MediaItemList>
				</CatalogType>
			</xsl:result-document>
		</xsl:for-each-group>
</xsl:template>

	<!-- suppress normal behavior of transmitting text to output document -->
	<xsl:template match="text()"/>
</xsl:stylesheet>

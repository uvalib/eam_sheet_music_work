<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xpath-default-namespace="http://www.loc.gov/mods/v3" xmlns:mods="http://www.loc.gov/mods/v3"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="mods fn xs">
	<xsl:param name="pid">
		<xsl:value-of select="//identifier[@displayLabel='UVA Library Fedora Repository PID'][1]"/>
	</xsl:param>
	<xsl:param name="dateIngestNow">
		<xsl:value-of select="false()"/>
	</xsl:param>
	<xsl:param name="shadowedItem">
		<xsl:value-of select="false()"/>
	</xsl:param>
	<xsl:param name="set-code" select="/mods:mods/mods:relatedItem[1]/mods:titleInfo[1]/title"/>
	<xsl:param name="repository">http://fedoratest.lib.virginia.edu:8080/fedora</xsl:param>
	<xsl:param name="contentModel">jp2k</xsl:param>
	<xsl:output byte-order-mark="no" encoding="UTF-8" media-type="text/xml" xml:space="preserve" indent="yes"/>
	
	<xsl:template match="//identifier[position()=last()]">
		<xsl:copy-of select="."/>
		<!-- adding new identifier containing PID -->
		<xsl:element name="identifier" inherit-namespaces="no" xmlns="http://www.loc.gov/mods/v3" exclude-result-prefixes="#all">
			<xsl:attribute name="type">local</xsl:attribute>
			<xsl:attribute name="displayLabel">UVA Library Fedora Repository PID</xsl:attribute>
			<xsl:value-of select="$pid"/>
		</xsl:element>
	</xsl:template>
	
	
	<xsl:template match="@*|node()" xmlns="http://www.loc.gov/mods/v3" exclude-result-prefixes="#all">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	</xsl:stylesheet>
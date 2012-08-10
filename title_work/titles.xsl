<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mods="http://www.loc.gov/mods/v3">

    <xsl:output method="text" encoding="UTF-8" indent="no"/>
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="/CatalogType/MediaItemList">
        <xsl:for-each select="MediaItem">
            <xsl:value-of select="AssetProperties/Filename"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="AnnotationFields/Headline"/>
            <xsl:if test="AnnotationFields/Caption">
                <xsl:text>,</xsl:text><xsl:value-of select="AnnotationFields/Caption"/>
            </xsl:if>
            <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="text()"/>
</xsl:stylesheet>


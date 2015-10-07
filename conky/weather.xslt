<?xml version="1.0" encoding="UTF-8"?>
<!-- This xslt script convert weather.xml file and output useful info
Usage:
- xsltproc wreather.xslt weather.xml
- xsltproc -stringparam day 2 weather.xslt weather.xml
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="text" media-type="text/plain" encoding="UTF-8" indent="no" />
    <xsl:param name="day" select="0" />     <!-- take value 0 to 6 -->

    <!-- 1) Identity transform -->
    <xsl:template match="/">
        <xsl:copy>
            <xsl:apply-templates select="weather/dayf/day[@d = $day]" />
        </xsl:copy>
    </xsl:template>

    <!-- 2) Select node -->
    <xsl:template match="day">
        <xsl:value-of select="sunr"/><xsl:text>|</xsl:text>                     <!-- sunrise -->
        <xsl:value-of select="suns"/><xsl:text>|</xsl:text>                     <!-- sunset -->
        <xsl:value-of select="@t"/><xsl:text>|</xsl:text>                       <!-- day -->
        <xsl:value-of select="low"/><xsl:text>°C|</xsl:text>                    <!-- min -->
        <xsl:value-of select="hi"/><xsl:text>°C|</xsl:text>                     <!-- max -->
        <xsl:value-of select="part[@p = 'd']/icon"/><xsl:text>|</xsl:text>  <!-- icon -->
        <xsl:value-of select="part[@p = 'n']/icon"/><xsl:text>|</xsl:text>  <!-- icon -->
    </xsl:template>
</xsl:stylesheet>


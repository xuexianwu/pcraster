<?xml version="1.0"?>

<!DOCTYPE xsl:stylesheet [
  <!ENTITY doNotEdit    "Don't edit: generated by OperationsToWrappers.xsl">
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
<xsl:output
  method="text"
/>
<xsl:strip-space elements="*"/>

<xsl:include href="OperationToWrapper.xsl"/>

<xsl:template match="Operations">

  <xsl:document href="operations.py"
    omit-xml-declaration="yes"
  >
    <xsl:text># &doNotEdit;
import pcraster._pcraster as _pcraster&#xA;</xsl:text>
<!--
    <xsl:apply-templates select="Operation[@syntax!='None'] | Operation[@name='if']" mode="py"/>
    -->
    <xsl:for-each select="Operation[@syntax!='None'] | Operation[@name='if']">
      <xsl:call-template name="pythonOperation">
        <xsl:with-param name="operation" select="."/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:document>

  <xsl:document href="operations.inc"
    omit-xml-declaration="yes"
  >
    <xsl:text disable-output-escaping="yes">// &doNotEdit;
#ifndef INCLUDED_MAJOR_OP
#include "major_op.h"
#define INCLUDED_MAJOR_OP
#endif
enum_&lt;MAJOR_CODE&gt;("MAJOR_CODE")&#xA;</xsl:text>
    <xsl:for-each select="Operation[@syntax!='None'] | Operation[@name='if']">
      <xsl:variable name="operation" select="."/>
      <xsl:for-each select="$operation/Result">
        <xsl:variable name="result" select="."/>

        <xsl:variable name="opcode">
          <xsl:call-template name="opcode">
            <xsl:with-param name="operation" select="$operation"/>
            <xsl:with-param name="result" select="$result"/>
          </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="concat('  .value(&quot;', $opcode, '&quot;, ', $opcode, ')&#xA;')"/>
      </xsl:for-each>
    </xsl:for-each>
    <xsl:text> ;&#xA;</xsl:text>
  </xsl:document>
</xsl:template>

</xsl:stylesheet>

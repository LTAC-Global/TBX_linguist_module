<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <ns uri="urn:iso:std:iso:30042:ed:3.0" prefix="tbx" />
    <ns uri="http://www.tbxinfo.net/ns/linguist" prefix="ling" />
    <ns uri="http://www.w3.org/2001/XMLSchema" prefix="xs" />
    
    <!-- Linguist Module Rules -->
    <pattern id="module.linguist.admin">
        <rule context="ling:reading">
            <assert test="parent::tbx:termSec or parent::tbx:adminGrp/parent::tbx:termSec">Reading must be at the term level.</assert>
        </rule>
        <rule context="ling:transferComment">
            <assert test="parent::tbx:langSec or parent::tbx:adminGrp/parent::tbx:langSec">transferComment may only be found at the langSec level.</assert>
        </rule>
    </pattern>
    
    <pattern id="module.linguist.adminNote">
        <rule context="ling:readingNote">
            <assert test="parent::tbx:adminGrp/parent::tbx:termSec">readingNote may only be found at the termSec level inside an adminGrp.</assert>
        </rule>
    </pattern>
    
    <pattern id="module.linguist.termNote">
        <rule context="ling:grammaticalNumber">
            <assert test="parent::tbx:termSec or parent::tbx:termNoteGrp/parent::tbx:termSec">grammaticalNumber may only appear at the termSec level.</assert>
            <assert test=".='singular' or .='plural' or .='dual' or .='mass' or .='otherNumber'">Permitted values of grammaticalNumber are: singular, plural, dual, mass, or otherNumber.</assert>
        </rule>
        <rule context="ling:register">
            <assert test="parent::tbx:termSec or parent::tbx:termNoteGrp/parent::tbx:termSec">register may only appear at the termSec level.</assert>
            <assert test=".='colloquialRegister' or .='neutralRegister' or .='technicalRegister' or .='in-houseRegister' or .='bench-levelRegister' or .='slangRegister' or .='vulgarRegister'">Permitted values of register are: 
                colloquialRegister, neutralRegister, technicalRegister, in-houseRegister, bench-levelRegister, slangRegister, or vulgarRegister</assert>
        </rule>
    </pattern>
    
</schema>
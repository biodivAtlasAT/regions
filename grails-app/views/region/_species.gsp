<g:if test="${!pageIndex || pageIndex == 0}">
<tbody id="speciesZone">
</g:if>

<g:if test="${species.totalRecords == 0}">
    <tr>
        <td colspan="3">No records found.</td>
    </tr>
</g:if>

<g:each in="${species.records}" var="singleSpecies" status="i">
    <tr class="link" id="${singleSpecies.guid}">
        <td>
            ${(pageIndex * 50) + i + 1}.
        </td>
        <td>
            ${singleSpecies.name}${singleSpecies.commonName ? " : ${singleSpecies.commonName}" : ""}
        </td>
        <td class="text-right">
            ${g.formatNumber(number: singleSpecies.count, type: 'number')}
        </td>
    </tr>
    <tr class="infoRowLinks" style="display: none;">
        <td>&nbsp;</td>
        <td colspan="2">
            <a href="${speciesPageUrl}/${singleSpecies.guid}" class="btn btn-mini" title="View Species page"><i class="fa fa-share-square-o"></i> Species Profile</a>
            &nbsp;|&nbsp;
            <a href="${rg.speciesRecordListUrl([name: singleSpecies.name, rank: singleSpecies.rank, regionFid: regionFid, regionName: regionName, regionType: regionType, from: from, to: to])}"
               class="btn btn-mini" title="View list of Records"><i class="fa fa-database"></i> List of Records</a>
        </td>
    </tr>
</g:each>

<g:if test="${species.records.size() > 0 && species.records.size() % 50 == 0}">
    <tr id="moreSpeciesZone" totalRecords="${species.totalRecords}">
        <td colspan="2" class="text-center">
            <a aa-refresh-zones="moreSpeciesZone" id="showMoreSpeciesButton"
               href="${g.createLink(controller: 'region', action: 'showSpecies', params: [pageIndex: pageIndex ? pageIndex + 1 : '1'])}"
               js-before="regionWidget.showMoreSpecies();"
               js-after="regionWidget.speciesLoaded();"
               class="btn btn-small"><i class="fa fa-plus"></i> Show more species</a>
        </td>
        <td></td>
    </tr>
</g:if>

<g:if test="${!pageIndex || pageIndex == 0}">
</tbody>
</g:if>


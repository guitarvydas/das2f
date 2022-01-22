export PATH="~/app/bin":$PATH

# views
querydisplay view0 >view0.bash
chmod a+x view0.bash
echo '-- view0.bash generated --' 1>&2

querydisplay view0b >view0b.bash
chmod a+x view0b.bash
echo '-- view0b.bash generated --' 1>&2

querydisplay view0b >view0b.bash
chmod a+x view0b.bash
echo '-- view0c.bash generated --' 1>&2

querydisplay view1 >view1.bash
chmod a+x view1.bash
echo '-- view1.bash generated --' 1>&2

querydisplay view2 >view2.bash
chmod a+x view2.bash
echo '-- view2.bash generated --' 1>&2

querydisplay view3 >view3.bash
chmod a+x view3.bash
echo '-- view3.bash generated --' 1>&2


# queries

das2fdir=`pwd`
temp=temp_${RANDOM}

pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue --support=${das2fdir}/implicitforall.support.js <layerallcontains.md >preprocessed_layerallcontains.md
querydisplay3 preprocessed_layerallcontains --prefix="${das2fdir}/" >layerallcontains_query.bash
chmod a+x layerallcontains_query.bash
echo '-- layerallcontains_query.bash generated --' 1>&2

pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=${das2fdir}/implicitforall.support.js <contains_port.md >preprocessed_contains_port.md
querydisplay3  preprocessed_contains_port  --prefix="${das2fdir}/" >layer4_query.bash
chmod a+x layer4_query.bash
echo '-- layer4_query.bash generated --' 1>&2

pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=${das2fdir}/implicitforall.support.js <indirect_contains.md >preprocessed_indirect_contains.md
querydisplay3  preprocessed_indirect_contains  --prefix="${das2fdir}/" >layer5_query.bash
chmod a+x layer5_query.bash
echo '-- layer5_query.bash generated --' 1>&2

pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=${das2fdir}/implicitforall.support.js <direct_contains.md >preprocessed_direct_contains.md
setquerydisplay preprocessed_direct_contains  --prefix="${das2fdir}/" >layer6_query.bash
chmod a+x layer6_query.bash
echo '-- layer6_query.bash generated --' 1>&2


pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=${das2fdir}/implicitforall.support.js <contains_edge1.md >preprocessed_contains_edge1.md
querydisplay3   preprocessed_contains_edge1 --prefix="${das2fdir}/" >layeredgecontainment1_query.bash
chmod a+x layeredgecontainment1_query.bash
echo '-- layeredgecontainment1_query.bash generated --' 1>&2
pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=${das2fdir}/implicitforall.support.js <contains_edge2.md >preprocessed_contains_edge2.md
querydisplay3   preprocessed_contains_edge2 --prefix="${das2fdir}/" >layeredgecontainment2_query.bash
chmod a+x layeredgecontainment2_query.bash
echo '-- layeredgecontainment2_query.bash generated --' 1>&2
pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=${das2fdir}/implicitforall.support.js <contains_edge3.md >preprocessed_contains_edge3.md
querydisplay3   preprocessed_contains_edge3 --prefix="${das2fdir}/" >layeredgecontainment3_query.bash
chmod a+x layeredgecontainment3_query.bash
echo '-- layeredgecontainment3_query.bash generated --' 1>&2


pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue <synccode.md >preprocessed_synccode.md
querydisplay3  preprocessed_synccode --prefix="${das2fdir}/"  >layersynccode_query.bash
chmod a+x layersynccode_query.bash
echo '-- layersynccode_query.bash generated --' 1>&2

pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=${das2fdir}/implicitforall.support.js <connection.md >preprocessed_connection.md
querydisplay3  preprocessed_connection --prefix="${das2fdir}/"  >layerconnection_query.bash
chmod a+x layerconnection_query.bash
echo '-- layerconnection_query.bash generated --' 1>&2

pre '#+ forall ' '#+ ' forall.ohm forall.glue --support=${das2fdir}/forall.support.js <layerkind.md >preprocessed_layerkind.md
pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=${das2fdir}/implicitforall.support.js <preprocessed_layerkind.md >preprocessed2_layerkind.md
querydisplay3  preprocessed2_layerkind --prefix="${das2fdir}/"  >layerkind_query.bash
chmod a+x layerkind_query.bash
echo '-- layerkind_query.bash generated --' 1>&2

pre  "#+ forall " "#+ " forall.ohm forall.glue  --support=${das2fdir}/forall.support.js <layercolor.md >preprocessed_layercolor.md
pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=${das2fdir}/implicitforall.support.js <preprocessed_layercolor.md >preprocessed2_layercolor.md
querydisplay3   preprocessed2_layercolor --prefix="${das2fdir}/" >layercolor_query.bash
chmod a+x layercolor_query.bash
echo '-- layercolor_query.bash generated --' 1>&2

pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=${das2fdir}/implicitforall.support.js <layername.md >preprocessed_layername.md
querydisplay3  preprocessed_layername --prefix="${das2fdir}/"  >layername_query.bash
chmod a+x layername_query.bash
echo '-- layername_query.bash generated --' 1>&2

pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=${das2fdir}/implicitforall.support.js <layerboundingbox.md >preprocessed_layerboundingbox.md
querydisplay3  preprocessed_layerboundingbox --prefix="${das2fdir}/"  >layerboundingbox_query.bash
chmod a+x layerboundingbox_query.bash
echo '-- layerboundingbox_query.bash generated --' 1>&2

pre  "#+ forall " "#+ " forall.ohm forall.glue  --support=${das2fdir}/forall.support.js <layerdirection.md >preprocessed_layerdirection.md
pre '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=${das2fdir}/implicitforall.support.js  <preprocessed_layerdirection.md >preprocessed2_layerdirection.md
querydisplay3   preprocessed2_layerdirection --prefix="${das2fdir}/" >layerdirection_query.bash
chmod a+x layerdirection_query.bash
echo '-- layerdirection_query.bash generated --' 1>&2

temp=temp_${RANDOM}

plpath=./
dr=~/projects/dr
mdfile=${dr}/dr-edgecontainment.md
fname=`basename -s '.md' $mdfile`
prep "cond\n" "endcond\n" ${dr}/cond.ohm ${dr}/cond.glue --inclusive --stop=1 --support=${dr}/drsupport.js <$mdfile >$temp
prep "." "$" ${dr}/designrule.ohm ${dr}/designrulea.glue --stop=1 --support=${dr}/drsupport.js --PLPATH=$plpath<$temp >a-$fname
prep "." "$" ${dr}/designrule.ohm ${dr}/designruleb.glue --stop=1 --support=${dr}/drsupport.js <$mdfile >b-$fname
chmod a+x a-$fname
chmod a+x b-$fname
echo '-- ' "design rules a-${fname} and b-${fname} generated" ' --' 1>&2




baton1=baton
rm -f ${baton1} && mkfifo ${baton1}
rm -r $temp


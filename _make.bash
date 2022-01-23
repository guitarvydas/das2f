# generate queries
#
# usage: ./make.bash <tools-root>

## temporary version that builds only 1 query -- used for debugging bash script(s)

root=$1

here=`pwd`
temp=temp_${RANDOM}

prep=$root/prep/prep
qd3=$here/qd3/querydisplay3.bash


# $prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue --support=$here/implicitforall.support.js <layerallcontains.md >preprocessed_layerallcontains.md
# $qd3 preprocessed_layerallcontains --prefix="$here/" >layerallcontains_query.bash
# chmod a+x layerallcontains_query.bash
# echo '-- layerallcontains_query.bash generated --' 1>&2

$prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue --support=$here/implicitforall.support.js <layerallcontains.md >preprocessed_layerallcontains.md

# $qd3 preprocessed_layerallcontains --prefix="$here/" >layerallcontains_query.bash
# $here/qd3/querydisplay3.bash \
#     $root \
#     $here/qd3 \
#     preprocessed_layerallcontains \
#     --prefix="$here/" \
#     >layerallcontains_query.bash
$qd3 $root $here/qd3 preprocessed_layerallcontains --prefix="$here/" >layerallcontains_query.bash

chmod a+x layerallcontains_query.bash
echo '-- layerallcontains_query.bash generated --' 1>&2

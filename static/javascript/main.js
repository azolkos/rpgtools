function updateHitbox(id) {
    var elem = document.getElementById(id);
    var sorting = id.split('_');
    if (id == 'wound_0_1' && elem.style.backgroundColor == 'red' && document.getElementById('wound_0_2').style.backgroundColor == '') {
        elem.style.backgroundColor = '';
        return;
    }
    for (let i=0; i >= Number(sorting[1]); i--) {
        document.getElementById('wound_'+i).style.backgroundColor = 'red';
        for (let j=1; j <= 4; j++) {
            if (i == Number(sorting[1]) && j > Number(sorting[2])) {
            } else {
                document.getElementById('wound_'+i+'_'+j).style.backgroundColor = 'red';
            }
        }
    }
    for (let i=Number(sorting[1]); i >= -9; i--) {
        document.getElementById('wound_'+i).style.backgroundColor = '';
        for (let j=1; j <= 4; j++) {
            if (i == Number(sorting[1]) && j <= Number(sorting[2])) {
            } else {
                document.getElementById('wound_'+i+'_'+j).style.backgroundColor = '';
            }
        }
    }
}

function updateCompStats() {
    var comp_stats = document.getElementsByClassName("comp_stat");
    let i = 0;
    while (comp_stats[i] != undefined) {
        var comp_stat = comp_stats[i].id.split("_");
        var parent = document.getElementById(comp_stat[1]);
        if (parent != null) {
            if (comp_stat[0] == 'BTM') {
                var body_types = document.getElementsByClassName("body_types");
                let j = 0;
                while (body_types[j] != undefined) {
                    var pts_from = body_types[j].getElementsByClassName("bodytype_ptsfrom")[0].innerHTML;
                    var pts_to = body_types[j].getElementsByClassName("bodytype_ptsto")[0].innerHTML;
                    if (Number(parent.value) >= Number(pts_from) && Number(parent.value) <= Number(pts_to.replace('None','9999'))) {
                        var modifier = body_types[j].getElementsByClassName("bodytype_modifier")[0].innerHTML;
                        document.getElementById(comp_stats[i].id).innerHTML = "["+ modifier +"]";
                        break;
                    }
                    j++;
                }
            } else {
                document.getElementById(comp_stats[i].id).innerHTML = "["+ parseInt(parent.value * comp_stat[2]) +"]";
            }
        }
        i++;
    }
}
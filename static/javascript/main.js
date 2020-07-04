function updateHitbox(id, w_max, w_min) {
    var this_elem = document.getElementById(id);
    var elem = id.split('_');
    if (elem[2] == 0 && elem[3] == 1 && this_elem.style.backgroundColor == 'red' && document.getElementById(elem[0]+'_wound_'+w_max+'_2').style.backgroundColor == '') {
        this_elem.style.backgroundColor = '';
        document.getElementById(elem[0]+'_wound_'+w_max).style.backgroundColor = '';
        return;
    }
    for (let i=w_max; i>=w_min; i--) {
        document.getElementById(elem[0]+'_wound_'+i).style.backgroundColor = '';
        for (let j=1; j<=4; j++) {
            document.getElementById(elem[0]+'_wound_'+i+'_'+j).style.backgroundColor = '';
        }
    }
    for (let i=w_max; i >= Number(elem[2]); i--) {
        document.getElementById(elem[0]+'_wound_'+i).style.backgroundColor = 'red';
        for (let j=1; j <= 4; j++) {
            if (i == Number(elem[2]) && j > Number(elem[3])) {
            } else {
                document.getElementById(elem[0]+'_wound_'+i+'_'+j).style.backgroundColor = 'red';
            }
        }
    }
}

function add_select(npc, target) {
    var sel = document.getElementById(npc+'_'+target+'select_1')
    if (sel.style.display == 'none') {
        sel.style.display = '';
    } else {
        var t = document.getElementById(npc+'_'+target+'_table');
        var r = t.insertRow();
        var c = r.insertCell();
        for (let i=1;;i++) {
            var idx = Number(sel.getElementsByTagName('select')[0].name.split('_')[2]) + i;
            var new_sel = document.getElementsByName(npc+'_'+target+'_'+idx)[0];
            if (new_sel) {
            } else {
                r.id = npc+'_'+target+'select_'+idx;
                c.innerHTML = sel.innerHTML;
                c.getElementsByTagName('select')[0].name = npc+'_'+target+'_'+idx;
                break;
            }
        }
    }
}

function remove_id(id) {
    document.getElementById(id).remove();
}

function remove_npc(npc) {
    document.getElementById('npc_'+npc).remove();
}
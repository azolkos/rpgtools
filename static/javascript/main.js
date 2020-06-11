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
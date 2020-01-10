function im = restore(arr,color)
    for row = 2:size(arr,1)-2
        for col = 2:size(arr,2)-2 
            if arr(row,col,1)>=150 && arr(row,col,2)>=150 && arr(row,col,3)>=150
                for pix = 1:3
                    sumdouble = 0;
                    for val = 1:5
                        sumdouble = double(sumdouble) + double(arr(row,col-val,pix)) + double(arr(row-val,col-val,pix)) + double(arr(row-val,col,pix)) + double(arr(row-val,col+val,pix));
                    end
                    someval = fix(sumdouble/20);
                    arr(row,col,pix) = someval;
                end
                i = row;
                j = col;
                sum1=double(0);
                sum2=double(0);
                sum3=double(0);
                
                howmuch = 2;
                factor = 0;
                
                for a = i-howmuch:i+howmuch
                    for b = j-howmuch:j+howmuch
                        if arr(a,b,1)<150 || arr(a,b,2)<150 || arr(a,b,3)<150
                        factor=factor+1;
                        sum1=sum1+double(arr(a,b,1));
                        sum2=sum2+double(arr(a,b,2));
                        sum3=sum3+double(arr(a,b,3));
                        end
                    end
                end
                
                sum1=fix(sum1/factor);
                sum2=fix(sum2/factor);
                sum3=fix(sum3/factor);
                howmuch = 1;
                for a = i-howmuch:i+howmuch
                    for b = j-howmuch:j+howmuch
                        if arr(a,b,1)<150 || arr(a,b,2)<150 || arr(a,b,3)<150
                        arr(a,b,1) = sum1;
                        arr(a,b,2) = sum2;
                        arr(a,b,3) = sum3;    
                    end
                end
            
            end
        end
    end
    im = arr;
end

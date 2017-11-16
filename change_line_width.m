function change_line_width(hObject, eventData, channelColors)

% Change LineWidth in raw_explorer main plot
%
% Written by Matteo Caffini
% CIMeC - Universita' dgli Studi di Trento
% on July, 14th 2017 in Rovereto (TN)
%

all_lines = findall(gca,'Type','line');
off_color = [100 100 100]/255;
on_color = flipud(channelColors);
n_lines = length(all_lines);

if get(hObject, 'Type') == 'line'
    if get(hObject, 'Color') == [100 100 100]/255
        for ii = 1:1:n_lines
            set(all_lines(ii), 'Color', on_color(ii,:));
        end
        if get(hObject, 'LineWidth') == 1
            colorSelected = get(hObject, 'Color');
            set(all_lines, 'LineWidth', 1)
            set(all_lines, 'Color', off_color)
            set(hObject, 'LineWidth', 3)
            set(hObject, 'Color', colorSelected)
        else
            set(all_lines, 'LineWidth', 1)
            for ii = 1:1:n_lines
                set(all_lines(ii), 'Color', on_color(ii,:));
            end
        end
    else
        if get(hObject, 'LineWidth') == 1
            colorSelected = get(hObject, 'Color');
            set(all_lines, 'LineWidth', 1)
            set(all_lines, 'Color', off_color)
            set(hObject, 'LineWidth', 3)
            set(hObject, 'Color', colorSelected)
        else
            set(all_lines, 'LineWidth', 1)
            for ii = 1:1:n_lines
                set(all_lines(ii), 'Color', on_color(ii,:));
            end
        end
    end
end
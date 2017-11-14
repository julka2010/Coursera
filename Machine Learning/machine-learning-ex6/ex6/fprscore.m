function [fscore, precision, recall] = fprscore(pred, real)

real_true = find(real);
l_pred_true_correct = length(find(pred(real_true) == real(real_true)));

precision = l_pred_true_correct/length(find(pred));
recall = l_pred_true_correct/length(real_true);

fscore = 2 * (precision*recall) / (precision+recall);

end

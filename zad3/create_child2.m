function child = create_child2(mother, father)
    %mother is choped
        if (randi([0 1], 1) == 1)
            if (mother.nnodes > father.nnodes)
                max_index = father.nnodes;                
            else
                max_index = mother.nnodes;                
            end
            
            chop_index = randi([2, max_index], 1);
            %mother
            %disp(mother.tostring)
            graft_index = mother.getparent(chop_index);
            mother_sub = mother.subtree(chop_index);
            mother = mother.chop(chop_index);
            
            father_sub = father.subtree(chop_index);
            while(father_sub.nnodes > mother_sub.nnodes)
                children = father_sub.getchildren(1);
                father_sub = father_sub.subtree(children(randi([1 2], 1)));
            end
            %disp(mother.tostring)
            
            %disp(father.tostring);
            
            child = mother.graft(graft_index, father_sub);
            
            %disp(child.tostring);
        else
            if (mother.nnodes > father.nnodes)
                max_index = father.nnodes;                
            else
                max_index = mother.nnodes;                
            end
            
            chop_index = randi([2, max_index], 1);
            %mother
            %disp(mother.tostring)
            graft_index = father.getparent(chop_index);
            father_sub = father.subtree(chop_index);
            father = father.chop(chop_index);
            
            mother_sub = mother.subtree(chop_index);
            while(mother_sub.nnodes > father_sub.nnodes)
                children = mother_sub.getchildren(1);
                mother_sub = mother_sub.subtree(children(randi([1 2], 1)));
            end
            %disp(mother.tostring)
            
            %disp(father.tostring);
            
            child = father.graft(graft_index, mother_sub);
            %disp(child.tostring);
        end
    

end
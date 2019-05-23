function child = create_child(mother, father)
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
            mother = mother.chop(chop_index);
            
            %disp(mother.tostring)
            
            %disp(father.tostring);
            
            child = mother.graft(graft_index, father.subtree(chop_index));
            
            %disp(child.tostring);
        else
            if (mother.nnodes > father.nnodes)
                max_index = father.nnodes;                
            else
                max_index = mother.nnodes;                
            end
            
            chop_index = randi([2, max_index], 1);
            %disp(father.tostring)
            graft_index = father.getparent(chop_index);
            father = father.chop(chop_index);
        
            %disp(father.tostring)
            
            %disp(father.tostring);
            child = father.graft(graft_index, mother.subtree(chop_index));
            %disp(child.tostring);
        end
    

end
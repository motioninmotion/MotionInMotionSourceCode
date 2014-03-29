class RemoteManager
  class << self
    include CDQ

    def setup
      RKObjectManager.sharedManager = manager
    end

    def object_manager
      RKObjectManager.sharedManager
    end

    private

    def manager
      Dispatch.once do
        @manager = RKObjectManager.managerWithBaseURL(NSURL.URLWithString('http://cryptic-everglades-8921.herokuapp.com/'))
        @manager.managedObjectStore = store
        @manager.addRequestDescriptor(task_request_descriptor)
        @manager.addResponseDescriptor(task_response_descriptor)
      end
      @manager
    end

    def store
      Dispatch.once do
        @store = RKManagedObjectStore.alloc.initWithPersistentStoreCoordinator(cdq.stores.current)
        @store.createManagedObjectContexts
        cdq.contexts.push(@store.persistentStoreManagedObjectContext)
        cdq.contexts.push(@store.mainQueueManagedObjectContext)
      end
      @store
    end

    def task_request_descriptor
      Dispatch.once do
        @task_request_descriptor = RKRequestDescriptor.requestDescriptorWithMapping(
          task_request_mapping,
          objectClass: Task,
          rootKeyPath: 'task',
          method: RKRequestMethodPOST | RKRequestMethodPATCH
        )
      end
      @task_request_descriptor
    end

    def task_request_mapping
      Dispatch.once do
        @task_request_mapping = RKObjectMapping.requestMapping
        @task_request_mapping.addAttributeMappingsFromArray(['name', 'note', 'due_at'])
        @task_request_mapping.addAttributeMappingsFromDictionary({'task_id' => 'id'})
      end
      @task_request_mapping
    end

    def task_response_descriptor
      Dispatch.once do
        @task_response_descriptor = RKResponseDescriptor.responseDescriptorWithMapping(
          task_mapping,
          method: RKRequestMethodAny,
          pathPattern: 'tasks.json',
          keyPath: '',
          statusCodes: RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)
        )
      end
      @task_response_descriptor
    end

    def task_mapping
      Dispatch.once do
        @task_mapping = RKEntityMapping.mappingForEntityForName('Task', inManagedObjectStore: store)
        @task_mapping.addAttributeMappingsFromArray(['name', 'note', 'due_at'])
        @task_mapping.addAttributeMappingsFromArray(['name', 'note', 'due_at'])
        @task_mapping.addAttributeMappingsFromDictionary({'id' => 'task_id'})
      end
      @task_mapping
    end
  end
end
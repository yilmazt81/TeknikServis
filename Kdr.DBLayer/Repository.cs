using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kdr.DBLayer
{
    public class Repository<T> : IRepository<T> where T : class
    {
        protected TeknikProjeEntities _Context;
   
        public Repository(TeknikProjeEntities context)
        {
            _Context = context; 
        }
       
        public bool Add(T model)
        {
            _Context.Set<T>().Add(model);
            return true;
        }

        public bool Add<A>(A model) where A : class
        {
            _Context.Set<A>().Add(model);
            return true;
        }

  

        public void Dispose()
        {
            _Context.Dispose();
        }

        public List<T> Get()
        {
            return _Context.Set<T>().ToList();
        }

        public bool Remove(T model)
        {
            _Context.Set<T>().Remove(model);
            return true;
        }

        public int Save()
        {
          return  _Context.SaveChanges();
        }
    }

    public interface IRepository<T> where T : class
    {
        List<T> Get();
        bool Add(T model);
        bool Add<A>(A model) where A : class;
        bool Remove(T model);
        int Save();
    }

   
}

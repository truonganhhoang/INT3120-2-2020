import {useEffect, useState, useCallback, useMemo} from 'react';
import axios from 'axios';
import qs from 'qs';

export const useQuery = ({ url, params = {}, skip = false }) => {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(false);
  const [errors, setErrors] = useState(null);
  const [forceRequest, setForceRequest] = useState(false);

  const extractParams = useMemo(() => JSON.stringify(params), [params]);

  useEffect(() => {
    if (!!skip) {
      return;
    }

    setErrors(null);
    setLoading(true);
    axios({
      url,
      method: 'get',
      params: JSON.parse(extractParams),
      paramsSerializer: /* istanbul ignore next */ params => {
        return qs.stringify(params, { arrayFormat: 'repeat' });
      },
    })
      .then(response => {
        if (response.status === 200) {
          setData(response.data);
        }
        setLoading(false);
      })
      .catch(error => {
        setErrors(error);
        setLoading(false);
      });
  }, [extractParams, url, forceRequest, skip]);

  const force = useCallback(() => {
    setForceRequest({});
  }, []);

  return { loading, data, errors, force };
};

Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45864BD8AC
	for <lists+cocci@lfdr.de>; Wed, 25 Sep 2019 09:01:40 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8P70th7028075;
	Wed, 25 Sep 2019 09:00:55 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D3BAB77B4;
	Wed, 25 Sep 2019 09:00:54 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2D90F76D9
 for <cocci@systeme.lip6.fr>; Wed, 25 Sep 2019 09:00:53 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8P70qXV009069;
 Wed, 25 Sep 2019 09:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1569394850;
 bh=PHBkHSsIVdSEaYBekryp+eOCmcgCF0GSnYhLIIZvZh0=;
 h=X-UI-Sender-Class:Subject:To:References:Cc:From:Date:In-Reply-To;
 b=HfuYTUxk7GPIJ6JF+haX7IiTLU7BEFpdO1S1LlNheyCOyKWhSgMcixoYNgUE3zLgw
 Zf8SKJklsrmOmRy3sm6kK5s/EWjhG5XKn4/8YDJfblP0kK/Oi4mwVuEHJReEQ7fT+X
 ZXePlIj5IflLxVPIOsYJqGMmu5IWfXnwylIi/bwM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.110.103]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MAvCS-1iMxRW0s9U-009zWe; Wed, 25
 Sep 2019 09:00:50 +0200
To: Julia Lawall <julia.lawall@lip6.fr>
References: <e07ce253-8a13-0f90-3ee0-79c1a0e78b38@web.de>
 <alpine.DEB.2.21.1909231058380.2283@hadrien>
 <c4437d9b-8795-fdfa-7914-fc30ead14cf7@web.de>
 <alpine.DEB.2.21.1909241729310.2282@hadrien>
 <f41b8e72-9a79-e65a-a652-8a257d5fac71@web.de>
 <alpine.DEB.2.21.1909242215440.2589@hadrien>
 <b22031b2-2382-e629-a11a-09be7fc8e9c3@web.de>
 <alpine.DEB.2.21.1909242249150.2589@hadrien>
 <425463ce-d244-c86b-8a05-19b6511f25ba@web.de>
 <alpine.DEB.2.21.1909250822040.2482@hadrien>
 <362dc557-b90d-e3df-e56f-f7ef283b6f01@web.de>
 <alpine.DEB.2.21.1909250837140.2482@hadrien>
 <8f5e6fc3-e2ac-3098-9724-0958a869e92e@web.de>
 <alpine.DEB.2.21.1909250854190.2482@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <77eb7949-b16b-ee07-be24-5dadccb25cb9@web.de>
Date: Wed, 25 Sep 2019 09:00:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909250854190.2482@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:o7nVzhd25pHJ0/AmU72w3pVNrS2vUR87C7a7kv23H85bHhQ9CBV
 EJhfjY+t5Id1zmMoW6k4K6VycxR666uiw4jCwt3ye78Betd/OoaaN1iZFt4pWHuS0NeDpPI
 ckT0KnwQNy0+dZ8Uq9nbTfz0CICUfSJePEJe8d3goy5UHIrV7nLXAAyMWk5SZ3oUofx1ZN6
 +y+URo+JZiWXe7ON0PjWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5cbF6kt7v1E=:krXuKg3O4VVHMRHWoymXlR
 YjpOtPqQVy3/2zm0lRxO3hByAnfAbV9c9eyyqEegbHyDn0PWLXErct2ogOnlyxtL/4dmz7IXS
 nBp7t9uk9PSermIgOFC860A3PISuyJBja/82W7JtattzRWBRdL0/PYzn9cdp18ae8Uy7PaIWQ
 c+smbLstDQudpOQ/ps78/NmvvGTzDVlecsOtoj2yf9i1CdeIINYwaza1wBOU4GFS1mQGhrEPw
 eFsVjpEE94CNlTAayIhf5BEIeIxDh1YMMiVIxpFnKvySvy9AwHR8gT1dKbfEQ7fOKqW/EmePp
 cCh5bgBh8aV22JAz8Vkd2KqdjNAQpBLi1Gu/CPUAYzGp6KZP5/8oPOscuZPCOnZXUFN+dBmEc
 VQDWFBqt2p33XKf6Y/SYbmVxvUQyyprc7KhkQJllFlyA07LmaM/TPAzvSiB0D38Le3MaF84Hk
 J6AkqhfBIBRCoy10fFZJ1JB5pP6TbNr7ODMyqyzaof0fNgUepDOsmF7B8pq1/Wfehl72ae992
 bam3e55avqzxSUbzmToqhoXqvtHXctd1THoS6cnjeOKA3boDZNJVmmw2s84ABaUGBpxHHgVkq
 a0fV8eX/aaqMMmWIu3t+ZAPbai6ZGfNcWXu1V1Wj7tv13DiTNAwZVr+tpthV52YuNnLN7RwP9
 E5r+JAdKVdib01AVNX38kosLsyuOVIgXGsI+SGpXIIN+e+1TY95mlXYA4ZeHmVOSc1HwiEq2I
 YU4uo71RLHq/l98SUUqRwjbLg6et1ARZWcOLQ0iXgDq43Bas91BeZ1H5ke2t8f7hAk356sa51
 bXwGTTu0OFGgYHTgq6YTBu2cVOh+jw/msvNcTpt0p7QbINSHGsswMxT2yAJDbnDydvo4Ut8UJ
 e0NV+wHNxo9dHYRUNkKeCxM+uMQLdT31QzMAdG2kfYubg2rzpwEmT6CtpVQZm/iNTfiwPqP60
 CY+KR4k7a2DCdKUfc1NyijvFyR6l5+ppFRwOznU/iigWZuChDNioWLqCFVn7nmRk6OChLrR6o
 2T9n2fp++6+rNR9JKAb7NDXvZc9+TuoiSN0nrEeSFL3ByfhHE9vaWO4PYxinBq1tge0cx8mmf
 RnYDVaEp6Jl6DmRCdAjd+6sIk+QDROholKH7xXAhwtcN+DQ91yR80q45Mnv6QPYcsVGAJTYSD
 EPrKC9Mb6CAelDBqjJXW7nO9glUj2ovKUmwVz6MyPzdna8Z1aIg5Tp85tEExCoE6VD2//DigX
 KgWbCibPJh4+caH8rlIJ2jlpSgRccbJ2oApt2pthwa14gGbw7qrMLu64+riU=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 25 Sep 2019 09:00:55 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 25 Sep 2019 09:00:52 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Reducing source code around return statements with SmPL?
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

>>>> * I would like to choose this setting for the execution of selected SmPL rules
>>>>   (instead of referring to a known command line parameter).
>>>
>>> This option is not offered.
>>
>> How are the chances to extend the Coccinelle software for this purpose?
>
> None.

It's a pity.


> I think you could use ( & ) to do what you want without this functionality.

I wonder how the usage of SmPL conjunctions can help more for the discussed use case.

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

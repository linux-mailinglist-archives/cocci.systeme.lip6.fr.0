Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 157FB31E90A
	for <lists+cocci@lfdr.de>; Thu, 18 Feb 2021 12:34:24 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11IBY0Tw029983;
	Thu, 18 Feb 2021 12:34:00 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 6FD3377D9;
	Thu, 18 Feb 2021 12:34:00 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E69BD376A
 for <cocci@systeme.lip6.fr>; Thu, 18 Feb 2021 12:33:58 +0100 (CET)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11IBXwd8007756
 for <cocci@systeme.lip6.fr>; Thu, 18 Feb 2021 12:33:58 +0100 (CET)
Received: by mail-lf1-f45.google.com with SMTP id z11so5995217lfb.9
 for <cocci@systeme.lip6.fr>; Thu, 18 Feb 2021 03:33:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uWo8yYtqo2c4AZiM2olPLzWcrY1h7XAQLSU0dGJI4kA=;
 b=SM1TQ897ra39CPY/1fyMl13Cw5FvhmRM/S3g3C0DleiN/N8YswFh6Gz5eBkuADu9/N
 +98Z5je4os6JG4llZodVtMNPLXpwiZ0xp7A1QcpCva1Q8wmaM3eTYQOkK42/WaQ4B3+S
 IjXoQ/fcIY1rLCVn28KqiIA1wN9/ddWym6y9hvYZgPPFOvYJWUvEtOuSswU2t9kgQGM2
 TGQJ6f0g4jTG6jBlA5XxJCH2xlde7dVUfH0NNGdNhGKuZrZGLphaKLt0El0JEkjNgL5/
 r15gf4O9M37TyBGwCls3EJ2SzYCdUb8absqLVyDQgYDrCeTw1ejteXVmWjbY2PQbCarX
 jY/Q==
X-Gm-Message-State: AOAM530oMjju052IfFIjv4dYXmC6x8Dh4lW4hY40wl+fbf0it1Hg/5W2
 L8Icqarl+2+pUYxMRD/rXrI=
X-Google-Smtp-Source: ABdhPJyyyfx53LASkeMjm2MZ/hol4PtA4yAuCP6z46pGk0DYkwDnQ4+aNNqGFnD6DAz+mzYm0ZJkcQ==
X-Received: by 2002:a19:6b19:: with SMTP id d25mr2305731lfa.82.1613648038111; 
 Thu, 18 Feb 2021 03:33:58 -0800 (PST)
Received: from [10.68.32.147] (broadband-188-32-236-56.ip.moscow.rt.ru.
 [188.32.236.56])
 by smtp.gmail.com with ESMTPSA id b11sm576394lfi.174.2021.02.18.03.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 03:33:57 -0800 (PST)
To: Julia Lawall <julia.lawall@inria.fr>
References: <20210216080133.455456-1-efremov@linux.com>
 <alpine.DEB.2.22.394.2102172224570.3081@hadrien>
 <c2b60288-3e46-14e3-9be2-3f75366a4b47@linux.com>
 <alpine.DEB.2.22.394.2102181114380.2748@hadrien>
 <4e913cc4-cb86-4552-bced-a89cbecca3b2@linux.com>
 <alpine.DEB.2.22.394.2102181227230.2748@hadrien>
From: Denis Efremov <efremov@linux.com>
Message-ID: <afd7f80a-90c9-9d05-cc78-aacc5495174b@linux.com>
Date: Thu, 18 Feb 2021 14:34:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2102181227230.2748@hadrien>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 18 Feb 2021 12:34:01 +0100 (CET)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 18 Feb 2021 12:33:58 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH] coccinelle: misc: add swap script
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



On 2/18/21 2:29 PM, Julia Lawall wrote:
> 
> 
> On Thu, 18 Feb 2021, Denis Efremov wrote:
> 
>>
>>
>> On 2/18/21 1:17 PM, Julia Lawall wrote:
>>>
>>>
>>> On Thu, 18 Feb 2021, Denis Efremov wrote:
>>>
>>>>
>>>>
>>>> On 2/18/21 12:31 AM, Julia Lawall wrote:
>>>>>> +@depends on patch@
>>>>>> +identifier tmp;
>>>>>> +expression a, b;
>>>>>> +type T;
>>>>>> +@@
>>>>>> +
>>>>>> +(
>>>>>> +- T tmp;
>>>>>> +|
>>>>>> +- T tmp = 0;
>>>>>> +|
>>>>>> +- T *tmp = NULL;
>>>>>> +)
>>>>>> +... when != tmp
>>>>>> +- tmp = a;
>>>>>> +- a = b;
>>>>>> +- b = tmp;
>>>>>> ++ swap(a, b);
>>>>>> +... when != tmp
>>>>>
>>>>> In this rule and the next one, if you remove the final ; from the b = tmp
>>>>> line and from the swap line, and put it into context code afterwards, them
>>>>> the generated code looks better on cases like fs/xfs/xfs_inode.c in the
>>>>> function xfs_lock_two_inodes where two successive swap calls are
>>>>> generated.
>>>>>
>>>>> There are also some cases such as drivers/net/wireless/ath/ath5k/phy.c in
>>>>> the function ath5k_hw_get_median_noise_floor where the swap code makes up
>>>>> a whole if branch.
>>>>
>>>>> In this cases it would be good to remove the {}.
>>>>
>>>> How this can be handled?
>>>>
>>>> If I use this pattern:
>>>> @depends on patch@
>>>> identifier tmp;
>>>> expression a, b;
>>>> @@
>>>>
>>>> (
>>>>   if (...)
>>>> - {
>>>> -       tmp = a;
>>>> -       a = b;
>>>> -       b = tmp
>>>> +       swap(a, b)
>>>>         ;
>>>> - }
>>>> |
>>>> -       tmp = a;
>>>> -       a = b;
>>>> -       b = tmp
>>>> +       swap(a, b)
>>>>         ;
>>>> )
>>>>
>>>> The tool fails with error:
>>>>
>>>> EXN: Failure("rule starting on line 58: already tagged token:\nC code
>>>> context\nFile \"drivers/net/wireless/ath/ath5k/phy.c\", line 1574,
>>>> column 4, charpos = 41650\n around = 'sort',\n whole content =
>>>> \t\t\t\tsort[j - 1] = tmp;") in drivers/net/wireless/ath/ath5k/phy.c
>>>
>>> A disjunction basically says "at this node in the cfg, can I match the
>>> first patter, or can I match the second pattern, etc."  Unfortunately in
>>> this case the two branches start matching at different nodes, so the short
>>> circuit aspect of a disjunction isn't used, and it matches both patterns.
>>>
>>> The solution is to just make two rules.  The first for the if case and the
>>> second for everything else.
>>>
>>
>>   if (...)
>> - {
>> -       tmp = a;
>> -       a = b;
>> -       b = tmp
>> +       swap(a, b)
>>         ;
>> - }
>>
>>
>> This produces "single-line ifs".
>> Maybe generated patches can be improved somehow?
>> Moving -+; doesn't help in this case.
> 
> There is clearly some problem with the management of newlines...
> 
> The other alternative is to just have one rule for introducing swap and
> another for removing the braces around a swap, ie
> 
> if (...)
> - {
>   swap(...);
> - }
> 
> I don't think it would be motivated to remove the newline in that case.

Yes, this works. I'll send v2.

Thanks
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

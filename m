Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C399D2F211E
	for <lists+cocci@lfdr.de>; Mon, 11 Jan 2021 21:49:55 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10BKn5Bu004187;
	Mon, 11 Jan 2021 21:49:05 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1056F77D9;
	Mon, 11 Jan 2021 21:49:05 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 490FB74B6
 for <cocci@systeme.lip6.fr>; Mon, 11 Jan 2021 21:49:03 +0100 (CET)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10BKn2aM025117
 for <cocci@systeme.lip6.fr>; Mon, 11 Jan 2021 21:49:02 +0100 (CET)
Received: by mail-lf1-f49.google.com with SMTP id x20so1468229lfe.12
 for <cocci@systeme.lip6.fr>; Mon, 11 Jan 2021 12:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xcAZTzjbFmu53C0jra/i5Xb6NNIwi9NhOZbjgSuMr+o=;
 b=ECiijwyweJ6r/cdfqDpN3puqYXMAqqz/47B/RxS/lDXf3BMFZHjTDlKccF3puuMYH2
 oYab9rNVpjyEtE7ptfArzWOf6blebep9B7/Vg1qqoA4EupxWFwyx5MWdx+vMtmtnVf2S
 Y38EH/fODURalZR9G/Nh8MZfsVTbN6AyWYTJfZ7VLxmA4BmXEOdXl4ZMqunS3ZkeckVs
 ePHTOp+8Bgb2f0EJ8n+WnQkAl6aJA2l3y4joftV6IH2tbO2kXYHwkAJJ1dJFnkOzxzNf
 1CDOhCld+eF1l0umObXmqJD+fIudSpYR3RBiIgy5lnXrhw4+nVMfDXalH5sP8EV8266p
 X2vg==
X-Gm-Message-State: AOAM531dpddqz3YcjpwPqFiNmUBvichZTe0UasKyO1OcuZ4a6E3tFmxg
 Jv5UYaAchSF+1wEH4m0eOH3KwIdOQrW5ow==
X-Google-Smtp-Source: ABdhPJyuJU19hUSYRRuCgVAQeCzomb94p0l0j9+JNkZzLt1zvd6XiWBQRT61kv/g4257nsJ62k/OfA==
X-Received: by 2002:a19:8c04:: with SMTP id o4mr583497lfd.333.1610398141438;
 Mon, 11 Jan 2021 12:49:01 -0800 (PST)
Received: from [10.68.32.192] (broadband-188-32-236-56.ip.moscow.rt.ru.
 [188.32.236.56])
 by smtp.gmail.com with ESMTPSA id d12sm94345ljl.111.2021.01.11.12.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 12:49:00 -0800 (PST)
To: Julia Lawall <julia.lawall@inria.fr>
References: <854fdad7-cf2d-49d8-571c-1ac64fa90fb6@linux.com>
 <alpine.DEB.2.22.394.2101112122350.15982@hadrien>
 <a9c270d0-19c4-0357-173f-a2f9c8a1d7ce@linux.com>
 <alpine.DEB.2.22.394.2101112135260.15982@hadrien>
From: Denis Efremov <efremov@linux.com>
Message-ID: <b671db37-a57a-6ee4-5324-26658c2ec9ef@linux.com>
Date: Mon, 11 Jan 2021 23:49:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2101112135260.15982@hadrien>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 11 Jan 2021 21:49:05 +0100 (CET)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 11 Jan 2021 21:49:02 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] How to match function-like macro calls,
 e.g. RTA_ALIGN(rta->rta_len)?
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



On 1/11/21 11:40 PM, Julia Lawall wrote:
> 
> 
> On Mon, 11 Jan 2021, Denis Efremov wrote:
> 
>>
>>
>> On 1/11/21 11:23 PM, Julia Lawall wrote:
>>>
>>>
>>> On Mon, 11 Jan 2021, Denis Efremov wrote:
>>>
>>>> Hi,
>>>>
>>>> Let's suppose I want to match otx_cpt_aead_cbc_aes_sha_setkey() function from
>>>> drivers/crypto/marvell/octeontx/otx_cptvf_algs.c file (linux kernel).
>>>>
>>>> My pattern:
>>>> @exists@
>>>> identifier rta, param, key, keylen;
>>>> position p;
>>>> @@
>>>>
>>>> otx_cpt_aead_cbc_aes_sha_setkey(...,
>>>> 	unsigned char *key, unsigned int keylen)
>>>> {
>>>> 	...
>>>> *	if (RTA_PAYLOAD(rta) < sizeof(*param))@p
>>>> 		goto badkey;
>>>> 	...
>>>> *	key += RTA_ALIGN(rta->rta_len);
>>>> *	keylen -= RTA_ALIGN(rta->rta_len);
>>>> 	...
>>>> }
>>>>
>>>> $ spatch --no-includes --include-headers --cocci-file test.cocci drivers/crypto/marvell/octeontx/otx_cptvf_algs.c
>>>> init_defs_builtins: /usr/lib64/coccinelle/standard.h
>>>> minus: parse error:
>>>>   File "test.cocci", line 13, column 9, charpos = 219
>>>>   around = 'RTA_ALIGN',
>>>>   whole content = *     key += RTA_ALIGN(rta->rta_len);
>>>>
>>>>
>>>> What can I do to match RTA_ALIGN(...) lines?
>>>
>>> I don't understand the problem.  I took your rule and your command line,
>>> and everything was fine.
>>
>> I use version:
>> spatch version 1.0.8-gc1dbb4f-dirty compiled with OCaml version 4.11.1
>> Flags passed to the configure script: --build=x86_64-redhat-linux-gnu --host=x86_64-redhat-linux-gnu --program-prefix= --disable-dependency-tracking --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64 --libexecdir=/usr/libexec --localstatedir=/var --sharedstatedir=/var/lib --mandir=/usr/share/man --infodir=/usr/share/info --with-python=/usr/bin/python3 --with-menhir=/usr/bin/menhir
>> OCaml scripting support: yes
>> Python scripting support: yes
>> Syntax of regular expressions: PCRE
>>
>> Maybe parsing error is fixed in new versions?
> 
> I can't imagine what would cause a parsing error here.  I don't see what
> could be special about RTA_ALIGN.  Normally Coccinelle doesn't even know
> that it is a macro.  Maybe you can try to simplify the semantic patch a
> little bit and see if there is some change that causes the problem to
> disappear?  Does the problem disappear if you use a name other than
> RTA_ALIGN?

Changing:
	key += RTA_ALIGN(rta->rta_len);
to:
	key = RTA_ALIGN(rta->rta_len);

makes the parsing error disappear.

Using aop instead of += leads to the same parsing error:
assignment operator aop;
key aop RTA_ALIGN(rta->rta_len);
init_defs_builtins: /usr/lib64/coccinelle/standard.h
minus: parse error: 
  File "test.cocci", line 14, column 10, charpos = 245
  around = 'RTA_ALIGN',
  whole content = *     key aop RTA_ALIGN(rta->rta_len);

Denis
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

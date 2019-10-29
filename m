Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B40A6E8AEB
	for <lists+cocci@lfdr.de>; Tue, 29 Oct 2019 15:37:45 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9TEbQ3G015605;
	Tue, 29 Oct 2019 15:37:26 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B6B6E77CC;
	Tue, 29 Oct 2019 15:37:26 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 047AE454C
 for <cocci@systeme.lip6.fr>; Tue, 29 Oct 2019 15:37:25 +0100 (CET)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20:0:0:0:344] (may be forged))
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9TEbOCG002878
 for <cocci@systeme.lip6.fr>; Tue, 29 Oct 2019 15:37:24 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id c22so2684421wmd.1
 for <cocci@systeme.lip6.fr>; Tue, 29 Oct 2019 07:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=a8mYbXXK5+KQUQaIvwcfrpjKf765samV6cQUxQNL5/o=;
 b=O31fbQcpDlQPaRDMeDghKQyKCpUZLsxpwu5wp8yldw9TK1V9CNDL4LgeBq9uR+2RGU
 ZjKJfJPZgpHiq3YdbZwMZPw9/RupSHfV+4O4Z5Nbe1YaYCM2hI3wpBupabJz6x77n3ug
 GhibiP9aLjoivl9amK7q9d+E+dGxrhAdMc4FJ2by+d54SbGyhS1b78g5i6PG1E6lhXMb
 CsYCOCOtkiSbxWs+bpBnQIA4YRmFwor5bXbUBkgsl8kWWHlNRjYCJmNf0ngNRywGoNv4
 PAKHgYlpuy54myGByRZTIBDXAyFCUqGvePGyDkK2up/0Xj/5VJTozHUssa87+G31WlCK
 WZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a8mYbXXK5+KQUQaIvwcfrpjKf765samV6cQUxQNL5/o=;
 b=QBgPE5XsSE5uHijKbCGPAapX4CfECJho6Z2CWZqW1Uzazqya56AFCqUKWy4/Y36fJX
 giZvdXJo2xCs8M04hoEGvtt8WSC2BoMNFEsTCDg5KoKV4fADJ2aFoE1RtbALZBxBnJkE
 ZRkFkhZYDTYWhrTJ45qeTovtcuHkfzXpmIo2a5ZjnnEgo+geLyE+1i1ZQsDjxQfTVcz0
 jC6R1oD8lYb/A3eluFBWGMd3qZ8PoDd8WeInwvAPEjQOi/06+GY01xYSVYOlDxHV2+CU
 jJkp+lI++M471FMQJQUiEu09JChysIw89HU3oq7Xn+h0JZffmE9ejOSLLvOVLO7PNvR1
 IZeA==
X-Gm-Message-State: APjAAAWSribvSEC94I+pCN1OcndM4RT7rLSXgkXRGZdHMxDkEeodwsfQ
 MTg1n7V4usP3UPwytz71sn0E6g==
X-Google-Smtp-Source: APXvYqzxpBRLFqGiJ7f1v7UKKd7e/gFBpwDGG+pYQ2pl8w7igd0rtuIooHzTdvIWuV6CCe5R2FioCw==
X-Received: by 2002:a05:600c:410:: with SMTP id
 q16mr4391860wmb.169.1572359843859; 
 Tue, 29 Oct 2019 07:37:23 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
 by smtp.gmail.com with ESMTPSA id b66sm3229561wmh.39.2019.10.29.07.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 07:37:23 -0700 (PDT)
Date: Tue, 29 Oct 2019 14:37:22 +0000
From: Matthias Maennich <maennich@google.com>
To: Julia Lawall <julia.lawall@lip6.fr>
Message-ID: <20191029143722.GB33177@google.com>
References: <CAK7LNAQ8Wi1zED0rYJhk9tYi5-jgCoyeHNtofvgKet4ZTzKFcA@mail.gmail.com>
 <alpine.DEB.2.21.1910291437450.2179@hadrien>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1910291437450.2179@hadrien>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 29 Oct 2019 15:37:28 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 29 Oct 2019 15:37:24 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: Coccinelle <cocci@systeme.lip6.fr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jessica Yu <jeyu@kernel.org>
Subject: Re: [Cocci] Warning message from 'make nsdeps' when namespace is
	lower cases
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Hi!

On Tue, Oct 29, 2019 at 02:38:36PM +0100, Julia Lawall wrote:
>
>
>On Tue, 29 Oct 2019, Masahiro Yamada wrote:
>
>> Hi.
>>
>> When I was playing with 'make nsdeps',
>> I saw a new warning.
>>
>> If I rename USB_STORAGE to usb_storage,
>> I see 'warning: line 15: should usb_storage be a metavariable?'
>> Why? I think it comes from spatch.
>
>Yes, it would come from spatch.
>
>> It should be technically OK to use either upper or lower cases
>> for the namespace name.
>
>What is normally wanted?  Uppercase or lowercase?

There is no (documented) preference or convention yet. The existing
namespaces (USB_STORAGE and MCB) use upper case. While technically both
should work, I have a personal preference for consistently using upper
case. Is there a way to suppress this warning as I agree that it might
be confusing?

Cheers,
Matthias

>
>julia
>
>>
>> Just apply the following, and try 'make nsdeps'.
>>
>>
>> diff --git a/drivers/usb/storage/Makefile b/drivers/usb/storage/Makefile
>> index 46635fa4a340..6f817d65c26b 100644
>> --- a/drivers/usb/storage/Makefile
>> +++ b/drivers/usb/storage/Makefile
>> @@ -8,7 +8,7 @@
>>
>>  ccflags-y := -I $(srctree)/drivers/scsi
>>
>> -ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=USB_STORAGE
>> +ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=usb_storage
>>
>>  obj-$(CONFIG_USB_UAS)          += uas.o
>>  obj-$(CONFIG_USB_STORAGE)      += usb-storage.o
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>> --
>> Best Regards
>> Masahiro Yamada
>>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

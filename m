Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C343A76F2
	for <lists+cocci@lfdr.de>; Tue, 15 Jun 2021 08:13:55 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 15F6DRpp019943;
	Tue, 15 Jun 2021 08:13:27 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1BB6A77F5;
	Tue, 15 Jun 2021 08:13:27 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2C42142CB
 for <cocci@systeme.lip6.fr>; Tue, 15 Jun 2021 08:13:25 +0200 (CEST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 15F6DOqJ027317
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 15 Jun 2021 08:13:24 +0200 (CEST)
Received: by mail-lj1-f180.google.com with SMTP id l4so10853841ljg.0
 for <cocci@systeme.lip6.fr>; Mon, 14 Jun 2021 23:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Qpjst8fUK2jK/roldcWP3QnKsbToK1R2ztKok4xwGQ=;
 b=CEciu2wNGa6M8NUQrmD2ij2oSvBd6+PCFJPM8gSeiV2anfD+kWX9SQDAiv1bbAaERq
 fA6tD9sKDzWmlLNROJieEC2udmULJU70IXPGDuP9uboAvANvFxgHGwhIp+ZbpewuK4hU
 cYurgKmPE4Pqx9ByZy+BX5pjhWZlpWyzE7MYr9xZB9m32EfNp84UNIbyD4ERCwEQHhVu
 1CdDO043jAUkLGWWUDrnGHUfAnzlglQZ0bmBRwmH71pow7UeEd3F0kHjCvC0S63xZSuF
 O5tUlyGLVLTvVxz7LZis1Ge6q97owCOlZUs4Qpfu+87ylxj5pOztPR0qlwrUVGLmSw4a
 IC8g==
X-Gm-Message-State: AOAM531HjsMVAZpyfnYMkhCyYGTs6B7dqBDAhmHcuuAGUVklB0BK9DVh
 2O/8gi/1qj8L95XmUAyMo+g=
X-Google-Smtp-Source: ABdhPJy61jxmtBw0XcLrWVfWzZx3LpWmvmn1dWxC7JwkwTxy+YmL+tnJbTP9tl1DCKT/ec+kVBvCWw==
X-Received: by 2002:a05:651c:1202:: with SMTP id
 i2mr16183629lja.323.1623737603819; 
 Mon, 14 Jun 2021 23:13:23 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-236-56.ip.moscow.rt.ru.
 [188.32.236.56])
 by smtp.gmail.com with ESMTPSA id h12sm2049998ljg.59.2021.06.14.23.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 23:13:23 -0700 (PDT)
To: Julia Lawall <Julia.Lawall@lip6.fr>
References: <20210428060350.57661-1-efremov@linux.com>
From: Denis Efremov <efremov@linux.com>
Message-ID: <6296d731-60d3-1ceb-226d-ded9d2d5a1f9@linux.com>
Date: Tue, 15 Jun 2021 09:13:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210428060350.57661-1-efremov@linux.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 15 Jun 2021 08:13:29 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 15 Jun 2021 08:13:24 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [RESEND PATCH] coccinelle: misc: minmax: suppress patch
 generation for err returns
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

Ping?

On 4/28/21 9:03 AM, Denis Efremov wrote:
> There is a standard idiom for "if 'ret' holds an error, return it":
> 	return ret < 0 ? ret : 0;
> 
> Developers prefer to keep the things as they are because stylistic
> change to "return min(ret, 0);" breaks readability.
> 
> Let's suppress automatic generation for this type of patches.
> 
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  scripts/coccinelle/misc/minmax.cocci | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/coccinelle/misc/minmax.cocci b/scripts/coccinelle/misc/minmax.cocci
> index eccdd3eb3452..fcf908b34f27 100644
> --- a/scripts/coccinelle/misc/minmax.cocci
> +++ b/scripts/coccinelle/misc/minmax.cocci
> @@ -116,16 +116,32 @@ func(...)
>  	...>
>  }
>  
> +// Don't generate patches for errcode returns.
> +@errcode depends on patch@
> +position p;
> +identifier func;
> +expression x;
> +binary operator cmp = {<, <=};
> +@@
> +
> +func(...)
> +{
> +	<...
> +	return ((x) cmp@p 0 ? (x) : 0);
> +	...>
> +}
> +
>  @pmin depends on patch@
>  identifier func;
>  expression x, y;
>  binary operator cmp = {<=, <};
> +position p != errcode.p;
>  @@
>  
>  func(...)
>  {
>  	<...
> --	((x) cmp (y) ? (x) : (y))
> +-	((x) cmp@p (y) ? (x) : (y))
>  +	min(x, y)
>  	...>
>  }
> 
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

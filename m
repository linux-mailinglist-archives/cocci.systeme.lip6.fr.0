Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A81E21ECC2C
	for <lists+cocci@lfdr.de>; Wed,  3 Jun 2020 11:10:08 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05399h8w007495;
	Wed, 3 Jun 2020 11:09:43 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3AD487828;
	Wed,  3 Jun 2020 11:09:43 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 6A7633BAB
 for <cocci@systeme.lip6.fr>; Wed,  3 Jun 2020 11:09:41 +0200 (CEST)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20:0:0:0:534])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05399eQ2006570
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 3 Jun 2020 11:09:40 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id c35so1111510edf.5
 for <cocci@systeme.lip6.fr>; Wed, 03 Jun 2020 02:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cilium-io.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=u7zyF1k665GykUDvjHaNMiafXw9TznEGvuiZuPpQO08=;
 b=PjoGMukds9NeGR4yCjU2QgyeNwBQZMzf8qeO6mPfLd8H64Ysre8C/id7IGn6fCIEQ+
 KXplKiu6YjUgZVEUbl9cD6oDUdy8OGlq30F0WtX7vU+HDP5ukQ7ECOQ6p2lNj1BvAF5J
 JXDTt7xsB/sfALPS/SKcnlzHr334CYDyCrpSvkuKjw9kzs+B2vLLALNLreHDNj8wl+Sa
 hPXQQd7B9i0ELMpEOo0kNNwBZYnrFlwXnEwBiX7R6Y2jN8JWtc7Djm/XZ7e8bRJZnbCM
 abJWlTwpCtStd+W5Xezz6VDWT5hFxXVpU+M7aN4EBd2rYQ56W34zKM8Bs0h0ZUm0WYqj
 Veag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=u7zyF1k665GykUDvjHaNMiafXw9TznEGvuiZuPpQO08=;
 b=K0qxWzPAWV1JuImXLbgiBIbkpb5fD7DH3U9G0HyDUziG66sdvlp1GzWd21Rma/BCzT
 NSPJB59WygdoqodYKbC/PR5yQbxSqaNMaf68T48D1tEJtgvIjxfqyLRL+HJ53Mh4Z4OE
 dKOhbRofiCwnF8WQcvLXNFMmJWh2eejz1jjAQPPbVTMNZbva3CvjxIZziqYWfP3RV4p2
 aOxGCpZ3MdntUy9wia5FGnio/m4PVgPwV3O8byrydtsF7uvYNx/1HujhHmtps+MwG0gF
 Yt3HXuGxzcQ5vH9RIvJxbcUfdZyOqjFW6Ascy8TvIwDp1je6G1ntNiekPQNV3hKB7ktP
 nGTw==
X-Gm-Message-State: AOAM531bTOWCMVG8ciSjxDLnxrPq3SU/F+KILe4hgwQa7TGSq20IYJxQ
 8L3GWZ28icg4Dx08QzeVzzX2X63FWA==
X-Google-Smtp-Source: ABdhPJx3V0iRS2GhVf/ITRLvrAc1EsKVj/lL16I5wODA5WA7OGFkl5aOHVM4qv7tPrkcJ1UlDMX9JQ==
X-Received: by 2002:a05:6402:376:: with SMTP id
 s22mr341454edw.250.1591175380188; 
 Wed, 03 Jun 2020 02:09:40 -0700 (PDT)
Received: from Mem ([81.30.78.170])
 by smtp.gmail.com with ESMTPSA id m3sm854202ede.58.2020.06.03.02.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 02:09:39 -0700 (PDT)
Date: Wed, 3 Jun 2020 11:09:39 +0200
From: Paul Chaignon <paul@cilium.io>
To: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <20200603090938.GA25007@Mem>
References: <1a1600a7-faf3-00bc-d616-25281bf5039b@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a1600a7-faf3-00bc-d616-25281bf5039b@web.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 03 Jun 2020 11:09:44 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Wed, 03 Jun 2020 11:09:40 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Excluding function names in SmPL rules
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

On Wed, Jun 03, 2020 at 10:23:59AM +0200, Markus Elfring wrote:
> > I couldn't find a way to do that from the first rule, so I whitelisted
> > send_drop_notify() with a second rule (rule2 below). That seems rather
> > cumbersome and I'm wondering if there's maybe a simpler approach?
> 
> Do you find the following source code search approach helpful for
> your software development needs?

No. It's the first approach I tried and it didn't match anything anymore;
I couldn't figure out why. It's the approach I was referring to by 'When I
tried using rule1 as the body of the function in rule2, it just didn't
match anything anymore'.

Paul

> 
> @display@
> identifier fn != send_drop_notify;
> type t;
> @@
>  t fn(...)
>  {
>  ... when any
> (ep_tail_call(...);
>  ... when forall
>  return DROP_MISSED_TAIL_CALL;
> |
> *ep_tail_call(...);
> )
>  ... when any
>  }
> 
> 
> Regards,
> Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

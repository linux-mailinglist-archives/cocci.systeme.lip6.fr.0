Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF7290BE
	for <lists+cocci@lfdr.de>; Fri, 24 May 2019 08:07:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4O674tg010549;
	Fri, 24 May 2019 08:07:04 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id DFAFC775D;
	Fri, 24 May 2019 08:07:03 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 56362768D
 for <cocci@systeme.lip6.fr>; Mon, 20 May 2019 19:20:45 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4KHKhEi022219
 for <cocci@systeme.lip6.fr>; Mon, 20 May 2019 19:20:44 +0200 (CEST)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA7F720675;
 Mon, 20 May 2019 17:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558372843;
 bh=y0qgGqkaWE/kipSaEaPyyR8jq8PGYKXzIS0tbcLGqT8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T7LDFzx1/j26xdrmdGnd4Vxk/tKpX7CER1YFC7xEGVrpLONxw97rPMieYRiUi4u67
 9+K/Y+woV2VZBB/bKo7nxunaBn+FEQtPoFiOQfiD7j/JzUZuBGKAbfcikO+wPJ+Eoq
 2qXVXVKUCa9CCxJTkx1bTlVpUNre2LKuXkUMmmjo=
Date: Mon, 20 May 2019 13:20:41 -0400
From: Sasha Levin <sashal@kernel.org>
To: Julia Lawall <julia.lawall@lip6.fr>
Message-ID: <20190520172041.GH11972@sasha-vm>
References: <201905171432571474636@zte.com.cn>
 <alpine.DEB.2.20.1905170912590.4014@hadrien>
 <20190520093303.GA9320@atrey.karlin.mff.cuni.cz>
 <alpine.DEB.2.21.1905201152040.2543@hadrien>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1905201152040.2543@hadrien>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 24 May 2019 08:07:06 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 20 May 2019 19:20:44 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Fri, 24 May 2019 08:07:02 +0200
Cc: michal.lkml@markovi.net, nicolas.palix@imag.fr,
        linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr,
        Markus.Elfring@web.de, Pavel Machek <pavel@ucw.cz>,
        wen.yang99@zte.com.cn
Subject: Re: [Cocci] Coccinelle: semantic patch for missing of_node_put
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

On Mon, May 20, 2019 at 11:52:37AM +0200, Julia Lawall wrote:
>
>
>On Mon, 20 May 2019, Pavel Machek wrote:
>
>> Hi!
>>
>> > A semantic patch has no access to comments.  The only thing I can see to
>> > do is to use python to interact with some external tools.  For example,
>> > you could write some code to collect the comments in a file and the lines
>> > on which they occur, and then get the comment that most closely precedes
>> > the start of the function.
>>
>> How dangerous is missing of_node_put? AFAICT it will only result into
>> very small, one-time memory leak, right?
>>
>> Could we make sure these patches are _not_ going to stable? Leaking
>> few bytes once per boot is not really a serious bug.
>
>Sasha,
>
>Probably patches that add only of_node_put should not be auto selected for
>stable.

I can filter them out, but those are fixes, right? Why are we concerned
about them making it into -stable?

--
Thanks,
Sasha
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B66F13C898
	for <lists+cocci@lfdr.de>; Wed, 15 Jan 2020 16:59:40 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00FFxEjA017368;
	Wed, 15 Jan 2020 16:59:14 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id AF05777F7;
	Wed, 15 Jan 2020 16:59:14 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 822FB77E3
 for <cocci@systeme.lip6.fr>; Wed, 15 Jan 2020 16:59:13 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00FFx7Lw006014
 for <cocci@systeme.lip6.fr>; Wed, 15 Jan 2020 16:59:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579103947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qfpp5wJKMlnzxc12pSltI6uPwhT1Xkjxgw0KQpMniLk=;
 b=H2losx//piDooy6cSCfkVWXinXV2CzkpKnQ1aCwQTnVUgn6enooSxB6WK77qSRWVA9T+IW
 vLUh+7Z1XotvyWZ0BJAEnP0FrjwDmwos596/Le8Meu9jegKbZrwJLSQ6Eqk+waH5DzDAGV
 G4faMnQ4XipJaAVX+2KRI06ComHmTfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345--n_XY-s8OYiUNys1LkbC-A-1; Wed, 15 Jan 2020 10:59:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5FD317F785;
 Wed, 15 Jan 2020 15:59:04 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
 by smtp.corp.redhat.com (Postfix) with SMTP id 2FD60108132E;
 Wed, 15 Jan 2020 15:59:04 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Wed, 15 Jan 2020 16:59:04 +0100 (CET)
Date: Wed, 15 Jan 2020 16:59:03 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Julia Lawall <julia.lawall@inria.fr>
Message-ID: <20200115155902.GA8632@redhat.com>
References: <20200115112540.GA18161@redhat.com>
 <alpine.DEB.2.21.2001151308380.5079@hadrien>
 <20200115153035.GA9172@redhat.com>
 <alpine.DEB.2.21.2001151641200.5079@hadrien>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2001151641200.5079@hadrien>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: -n_XY-s8OYiUNys1LkbC-A-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 15 Jan 2020 16:59:14 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 15 Jan 2020 16:59:07 +0100 (CET)
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Q: does spatch understand typeof?
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

On 01/15, Julia Lawall wrote:
>
> On Wed, 15 Jan 2020, Oleg Nesterov wrote:
>
> > $ spatch --sp-file test.cocci test.c
> >
> > 	(ONCE) Expected tokens mem TTT
> > 	Skipping: test.c
> >
> > I tried to play with various --.*include.* options, but nothing seems to work
> > unless I add "inc.h" to the command line explicitly.
>
> The problem is that the file filtering happens before the parsing, and it
> is the parsing that finds the includes.

Yes, thanks, this was clear to me,

> You can disable the file
> filtering with --disable-worth-trying-opt.

Heh. I swear, I even did

	$ spatch --longhelp 2>&1 | grep disable

but apparently I can't read.

Thanks a lot!

Oleg.

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7375668469
	for <lists+cocci@lfdr.de>; Mon, 15 Jul 2019 09:34:34 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6F7Y4FQ013451;
	Mon, 15 Jul 2019 09:34:04 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 595E8778F;
	Mon, 15 Jul 2019 09:34:04 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 214FE7699
 for <cocci@systeme.lip6.fr>; Mon, 15 Jul 2019 09:34:01 +0200 (CEST)
Received: from mail15.wdc04.mandrillapp.com (mail15.wdc04.mandrillapp.com
 [205.201.139.15])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6F7XxoF024044
 for <cocci@systeme.lip6.fr>; Mon, 15 Jul 2019 09:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mandrill; d=nexedi.com;
 h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
 i=kirr@nexedi.com; 
 bh=VSAtOYjdYu8frJkKtKcesmwi099NUTNw9EPSls9KEqE=;
 b=XD405b8941VRcXAU+gGOQ/4UbnMEwZhJ+qayUEbAXwWqqkpwCOYggUlYw5OcHFeCmQNR74gEvgH7
 EvgHA4nM6U1r4q5/sGHWcOmkeJCUkUUhz7G6olSUdQPAuDoATuElG2FLowL8nHa+eTi4PKX7oi1M
 hPYJTjJjbDACrUa0oRs=
Received: from pmta08.mandrill.prod.suw01.rsglab.com (127.0.0.1) by
 mail15.wdc04.mandrillapp.com id h5gm6g1jvmgf for <cocci@systeme.lip6.fr>;
 Mon, 15 Jul 2019 07:33:59 +0000 (envelope-from
 <bounce-md_31050260.5d2c2c67.v1-bc7aa93f62fd47d3810f37c6d0491484@mandrillapp.com>)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1563176039; h=From : 
 Subject : To : Cc : Message-Id : References : In-Reply-To : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=VSAtOYjdYu8frJkKtKcesmwi099NUTNw9EPSls9KEqE=; 
 b=PdtJb98I5GQcqlmK+4hf2AkthiUWCVFutWAfJcAxImOTugFUxSTzl5Roq4E0iV5tw6MWkU
 2aoSUmAa2SdB3avczozuyyE8T+UYtv5n1bDCRLlLXMJBGe7YKQppZnivopsmz2T8w9FvhN7F
 x6f+qE1w6s7LnaxdpdbtVCqkfiFjU=
From: Kirill Smelkov <kirr@nexedi.com>
Received: from [87.98.221.171] by mandrillapp.com id
 bc7aa93f62fd47d3810f37c6d0491484; Mon, 15 Jul 2019 07:33:59 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-Id: <20190715073353.GA3208@deco.navytux.spb.ru>
References: <20190714141317.GA20277@deco.navytux.spb.ru>
 <156315060268.32091.6748401501797941411.pr-tracker-bot@kernel.org>
In-Reply-To: <156315060268.32091.6748401501797941411.pr-tracker-bot@kernel.org>
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here:
 http://mandrillapp.com/contact/abuse?id=31050260.bc7aa93f62fd47d3810f37c6d0491484
X-Mandrill-User: md_31050260
Date: Mon, 15 Jul 2019 07:33:59 +0000
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 15 Jul 2019 09:34:06 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 15 Jul 2019 09:34:00 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-iio@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
        pr-tracker-bot@kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        linux-fsdevel@vger.kernel.org, Jan Blunck <jblunck@suse.de>,
        cocci@systeme.lip6.fr, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Cocci] [PULL] stream_open bits for Linux 5.3
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

On Mon, Jul 15, 2019 at 12:30:02AM +0000, pr-tracker-bot@kernel.org wrote:
> The pull request you sent on Sun, 14 Jul 2019 14:13:45 +0000:
> 
> > https://lab.nexedi.com/kirr/linux.git stream_open-5.3
> 
> has been merged into torvalds/linux.git:
> https://git.kernel.org/torvalds/c/fcd98147ac71f35b69e2f50b5fddc5524dd2dfa8

Thanks.
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
